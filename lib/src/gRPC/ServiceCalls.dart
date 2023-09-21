

import 'dart:math';

import 'package:grpc/grpc.dart';
import 'package:logging/logging.dart';
import 'package:wrapper_gui/src/gRPC/DownloaderService.dart';

import '../generated/downloaderConfig.pb.dart';

class ServiceCalls {

final logger = Logger("ServiceCalls");

  // Created general gRPC method/structure
  Future<T> safeGrpcCall<T>(Future<T> Function() call, {required T erroneousResponse, int retries = 3}) async {
    int attempt = 0;
    while (attempt <= retries) {
      attempt++;
      try {
        return await call();
      }
      on GrpcError catch (e) {
        logger.warning("gRPC error: ${e.message}, code: ${e.code}");
        if (e.code == StatusCode.unavailable) {  // Retry on Unavailable
          logger.warning('Retry gRPC call $attempt time...');

          await Future.delayed(Duration(seconds: 2 * attempt));
        } else {
          return erroneousResponse;
        }
      } catch (e) {
        logger.warning("$e from generic error");
      }
    }
    return erroneousResponse;
  }


  Future<DownloaderResponse> downloaderCall2(DownloaderRequest request) async {
    print(request);
    var config = request.config;
    logger.info(config.link);
    var erroneousResponse = DownloaderResponse()
      ..status = 400
    ,responsePayload = "An error occurred!"; // Add more fields based on your requirements
    return await safeGrpcCall(() async {
      var response = await DownloaderService.instance.client.executeCommand(request);
      logger.severe(response);
      return response;
    }, erroneousResponse: erroneousResponse);
  }


Future<DownloaderResponse> downloaderCall(DownloaderRequest request) async {
    print("let's try");
    DownloaderResponse response = await DownloaderService.instance.client.executeCommand(request);
    print(response);
    return response;
}



}