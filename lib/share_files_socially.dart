import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class ShareFilesSocially {
  static const MethodChannel _channel =
      const MethodChannel('channel:com.mobion.share_files_socially.fileprovider/share');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static void shareFile(String path, String fileName) async {
    final ByteData bytes = await rootBundle.load(path + '/' + fileName);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file = await new File('${tempDir.path}/' + fileName).create();
    file.writeAsBytesSync(list);
    _channel.invokeMethod('shareFilesTest', fileName);
  }
}
