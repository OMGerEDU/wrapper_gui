//
//  Generated code. Do not modify.
//  source: downloaderConfig.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class DownloaderRequest extends $pb.GeneratedMessage {
  factory DownloaderRequest() => create();
  DownloaderRequest._() : super();
  factory DownloaderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloaderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DownloaderRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'downloaderConfig'), createEmptyInstance: create)
    ..aOM<DownloaderConfig>(1, _omitFieldNames ? '' : 'config', subBuilder: DownloaderConfig.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloaderRequest clone() => DownloaderRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloaderRequest copyWith(void Function(DownloaderRequest) updates) => super.copyWith((message) => updates(message as DownloaderRequest)) as DownloaderRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloaderRequest create() => DownloaderRequest._();
  DownloaderRequest createEmptyInstance() => create();
  static $pb.PbList<DownloaderRequest> createRepeated() => $pb.PbList<DownloaderRequest>();
  @$core.pragma('dart2js:noInline')
  static DownloaderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloaderRequest>(create);
  static DownloaderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  DownloaderConfig get config => $_getN(0);
  @$pb.TagNumber(1)
  set config(DownloaderConfig v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasConfig() => $_has(0);
  @$pb.TagNumber(1)
  void clearConfig() => clearField(1);
  @$pb.TagNumber(1)
  DownloaderConfig ensureConfig() => $_ensure(0);
}

class DownloaderResponse extends $pb.GeneratedMessage {
  factory DownloaderResponse() => create();
  DownloaderResponse._() : super();
  factory DownloaderResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloaderResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DownloaderResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'downloaderConfig'), createEmptyInstance: create)
    ..aOM<DownloaderConfig>(1, _omitFieldNames ? '' : 'config', subBuilder: DownloaderConfig.create)
    ..aOS(2, _omitFieldNames ? '' : 'error')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloaderResponse clone() => DownloaderResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloaderResponse copyWith(void Function(DownloaderResponse) updates) => super.copyWith((message) => updates(message as DownloaderResponse)) as DownloaderResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloaderResponse create() => DownloaderResponse._();
  DownloaderResponse createEmptyInstance() => create();
  static $pb.PbList<DownloaderResponse> createRepeated() => $pb.PbList<DownloaderResponse>();
  @$core.pragma('dart2js:noInline')
  static DownloaderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloaderResponse>(create);
  static DownloaderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  DownloaderConfig get config => $_getN(0);
  @$pb.TagNumber(1)
  set config(DownloaderConfig v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasConfig() => $_has(0);
  @$pb.TagNumber(1)
  void clearConfig() => clearField(1);
  @$pb.TagNumber(1)
  DownloaderConfig ensureConfig() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get status => $_getIZ(2);
  @$pb.TagNumber(3)
  set status($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);
}

class DownloaderConfig extends $pb.GeneratedMessage {
  factory DownloaderConfig() => create();
  DownloaderConfig._() : super();
  factory DownloaderConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloaderConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DownloaderConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'downloaderConfig'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'link')
    ..aOS(2, _omitFieldNames ? '' : 'path')
    ..aOS(3, _omitFieldNames ? '' : 'command')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloaderConfig clone() => DownloaderConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloaderConfig copyWith(void Function(DownloaderConfig) updates) => super.copyWith((message) => updates(message as DownloaderConfig)) as DownloaderConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloaderConfig create() => DownloaderConfig._();
  DownloaderConfig createEmptyInstance() => create();
  static $pb.PbList<DownloaderConfig> createRepeated() => $pb.PbList<DownloaderConfig>();
  @$core.pragma('dart2js:noInline')
  static DownloaderConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloaderConfig>(create);
  static DownloaderConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get link => $_getSZ(0);
  @$pb.TagNumber(1)
  set link($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLink() => $_has(0);
  @$pb.TagNumber(1)
  void clearLink() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get command => $_getSZ(2);
  @$pb.TagNumber(3)
  set command($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCommand() => $_has(2);
  @$pb.TagNumber(3)
  void clearCommand() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
