import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:share_files_socially/share_files_socially.dart';

void main() {
  const MethodChannel channel = MethodChannel('share_files_socially');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ShareFilesSocially.platformVersion, '42');
  });
}
