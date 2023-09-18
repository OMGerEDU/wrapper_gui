//
//  Generated code. Do not modify.
//  source: downloaderConfig.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'downloaderConfig.pb.dart' as $0;

export 'downloaderConfig.pb.dart';

@$pb.GrpcServiceName('downloaderConfig.DownloaderManagerService')
class DownloaderManagerServiceClient extends $grpc.Client {
  static final _$executeCommand = $grpc.ClientMethod<$0.DownloaderConfig, $0.DownloaderConfig>(
      '/downloaderConfig.DownloaderManagerService/ExecuteCommand',
      ($0.DownloaderConfig value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DownloaderConfig.fromBuffer(value));

  DownloaderManagerServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.DownloaderConfig> executeCommand($0.DownloaderConfig request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$executeCommand, request, options: options);
  }
}

@$pb.GrpcServiceName('downloaderConfig.DownloaderManagerService')
abstract class DownloaderManagerServiceBase extends $grpc.Service {
  $core.String get $name => 'downloaderConfig.DownloaderManagerService';

  DownloaderManagerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.DownloaderConfig, $0.DownloaderConfig>(
        'ExecuteCommand',
        executeCommand_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DownloaderConfig.fromBuffer(value),
        ($0.DownloaderConfig value) => value.writeToBuffer()));
  }

  $async.Future<$0.DownloaderConfig> executeCommand_Pre($grpc.ServiceCall call, $async.Future<$0.DownloaderConfig> request) async {
    return executeCommand(call, await request);
  }

  $async.Future<$0.DownloaderConfig> executeCommand($grpc.ServiceCall call, $0.DownloaderConfig request);
}
