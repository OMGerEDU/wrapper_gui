import 'package:flutter/services.dart';

import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';
import 'dart:io';
import 'package:wrapper_gui/src/generated/downloaderConfig.pbgrpc.dart';

class DownloaderService {
  String hostURL = "api.OMGer.com";
  int port = 8082;




  DownloaderService._internal();

  static final DownloaderService _instance = DownloaderService._internal();

  factory DownloaderService() => _instance;

  ///static Service instance that we will call when we want to make requests
  static DownloaderService get instance => _instance;

  ///HelloClient is the  class that was generated for us when we ran the generation command
  ///We will pass a channel to it to intialize it
  late DownloaderManagerServiceClient _client;

  Future<void> init() async {
    _createChannel();
  }

  // GatewayManagerServiceClient get client => _client;
  DownloaderManagerServiceClient get client {
    return _client;
  }

  _createChannel() async {
    final certBytes = await getCertificateBytes('assets/certs/ca-cert.pem');

    final credentials = ChannelCredentials.secure(
      certificates: certBytes,
      // authority: 'your_authority', // optional, use if required
      onBadCertificate: (certificate, host) {
        print('Failed to validate certificate from $host: $certificate');
        print('Subject: ${certificate.subject}');
        print('Issuer: ${certificate.issuer}');
        print('Start date: ${certificate.startValidity}');
        print('End date: ${certificate.endValidity}');
        // Return true to allow the bad certificate
        return true;
      },
    );
    final channel = ClientChannel('127.0.0.1', port: 8082, options: ChannelOptions(credentials: credentials));
    _client = DownloaderManagerServiceClient(channel);
    print("Channel created with host $hostURL:$port");
  }

  Future<List<int>> getCertificateBytes(String path) async {
    final byteData = await rootBundle.load(path);
    return byteData.buffer.asUint8List();
  }




}

Future<List<int>> getCertificateBytes(String path) async {
  final byteData = await rootBundle.load(path);
  return byteData.buffer.asUint8List();
}



// Future<SecurityContext> loadTLScredentials() async {
//   final clientCertFile = File('cert/client-cert.pem');
//   final clientKeyFile = File('cert/client-key.pem');
//   final serverCACert = File('cert/ca-cert.pem');
//
//   if (!clientCertFile.existsSync() || !clientKeyFile.existsSync() || !serverCACert.existsSync()) {
//     throw const TlsException('cert files not found');
//   }
//
//   final context = SecurityContext.defaultContext;
//   context.useCertificateChain(clientCertFile.path);
//   context.usePrivateKey(clientKeyFile.path);
//   context.setTrustedCertificates(serverCACert.path);
//
//   return context;
// }


// final rootCert =  getCertificateBytes('cert/ca-cert.pem');
// final caCert = await File('cert/ca-cert.pem').readAsBytes();
// final channelCredentials = ChannelCredentials.secure(certificates: await rootCert,);
// final channelCredentials = ChannelCredentials.secure(
//   certificates: caCert,
//   authority: "*.OMGer.com",
//   // password: '',
//   onBadCertificate: (certificate, host) {
//     // Handle what happens on bad certificate
//     // return true to continue, false to reject
//     return true;
//   },
// );