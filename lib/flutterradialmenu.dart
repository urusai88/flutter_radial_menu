import 'dart:async';

import 'package:flutter/services.dart';

class Flutterradialmenu {
  static const MethodChannel _channel =
      const MethodChannel('flutterradialmenu');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
