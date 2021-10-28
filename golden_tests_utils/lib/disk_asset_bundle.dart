import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';

/// A simple implementation of [AssetBundle] that reads files from an asset dir.
///
/// This is meant to be similar to the default [rootBundle] for testing.
class DiskAssetBundle extends CachingAssetBundle {
  static const _assetManifestDotJson = 'AssetManifest.json';

  static Future<AssetBundle> loadAll() async {
    return await loadGlob(['**/*']);
  }

  /// Creates a [DiskAssetBundle] by loading [globs] of assets under `assets_for_test/`.
  static Future<AssetBundle> loadGlob(
    Iterable<String> globs, {
    String from = 'assets_for_test',
  }) async {
    final cache = <String, ByteData>{};
    for (final pattern in globs) {
      await for (final path in Glob(pattern).list(root: buildRelativePath(from))) {
        if (path is File) {
          final bytes = await (path as File).readAsBytes();
          cache[buildKey(path.path)] = ByteData.view(bytes.buffer);
        }
      }
    }
    final manifest = <String, List<String>>{};
    cache.forEach((key, _) {
      manifest[key] = [key];
    });

    cache[_assetManifestDotJson] = ByteData.view(
      Uint8List.fromList(jsonEncode(manifest).codeUnits).buffer,
    );

    return DiskAssetBundle._(cache);
  }

  final Map<String, ByteData> _cache;

  DiskAssetBundle._(this._cache);

  @override
  Future<ByteData> load(String key) async {
    return _cache[key] ?? ByteData(0);
  }

  static String buildRelativePath(String path) {
    if (isInDS()) {
      path = '../$path';
    }
    return path;
  }

  static String buildKey(String key) {
    if (isInDS()) {
      return key.substring(key.indexOf('assets_for_test/'));
    }
    return key;
  }

  static bool isInDS() => Directory.current.path.contains('design_system');
}
