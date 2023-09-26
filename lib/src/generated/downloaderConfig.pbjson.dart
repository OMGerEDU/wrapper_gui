//
//  Generated code. Do not modify.
//  source: downloaderConfig.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use downloaderRequestDescriptor instead')
const DownloaderRequest$json = {
  '1': 'DownloaderRequest',
  '2': [
    {'1': 'config', '3': 1, '4': 1, '5': 11, '6': '.downloaderConfig.DownloaderConfig', '10': 'config'},
  ],
};

/// Descriptor for `DownloaderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloaderRequestDescriptor = $convert.base64Decode(
    'ChFEb3dubG9hZGVyUmVxdWVzdBI6CgZjb25maWcYASABKAsyIi5kb3dubG9hZGVyQ29uZmlnLk'
    'Rvd25sb2FkZXJDb25maWdSBmNvbmZpZw==');

@$core.Deprecated('Use downloaderResponseDescriptor instead')
const DownloaderResponse$json = {
  '1': 'DownloaderResponse',
  '2': [
    {'1': 'config', '3': 1, '4': 1, '5': 11, '6': '.downloaderConfig.DownloaderConfig', '10': 'config'},
    {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    {'1': 'status', '3': 3, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `DownloaderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloaderResponseDescriptor = $convert.base64Decode(
    'ChJEb3dubG9hZGVyUmVzcG9uc2USOgoGY29uZmlnGAEgASgLMiIuZG93bmxvYWRlckNvbmZpZy'
    '5Eb3dubG9hZGVyQ29uZmlnUgZjb25maWcSFAoFZXJyb3IYAiABKAlSBWVycm9yEhYKBnN0YXR1'
    'cxgDIAEoBVIGc3RhdHVz');

@$core.Deprecated('Use downloaderConfigDescriptor instead')
const DownloaderConfig$json = {
  '1': 'DownloaderConfig',
  '2': [
    {'1': 'link', '3': 1, '4': 1, '5': 9, '10': 'link'},
    {'1': 'path', '3': 2, '4': 1, '5': 9, '10': 'path'},
    {'1': 'downloadType', '3': 3, '4': 1, '5': 9, '10': 'downloadType'},
    {'1': 'command', '3': 4, '4': 1, '5': 9, '10': 'command'},
    {'1': 'isPlaylist', '3': 5, '4': 1, '5': 8, '10': 'isPlaylist'},
  ],
};

/// Descriptor for `DownloaderConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloaderConfigDescriptor = $convert.base64Decode(
    'ChBEb3dubG9hZGVyQ29uZmlnEhIKBGxpbmsYASABKAlSBGxpbmsSEgoEcGF0aBgCIAEoCVIEcG'
    'F0aBIiCgxkb3dubG9hZFR5cGUYAyABKAlSDGRvd25sb2FkVHlwZRIYCgdjb21tYW5kGAQgASgJ'
    'Ugdjb21tYW5kEh4KCmlzUGxheWxpc3QYBSABKAhSCmlzUGxheWxpc3Q=');

