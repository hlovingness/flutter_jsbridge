
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterJsbridge {
  static const MethodChannel _channel = const MethodChannel('flutter_jsbridge');

  FlutterJsbridge() {
    _channel.setMethodCallHandler(_onMethodCall);
  }

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<bool> isMainThread() async {
    return await _channel.invokeMethod("isMainThread");
  }

  Future<String> handlerReturnData(String url) async {
    return await _channel.invokeMethod("handlerReturnData", url);
  }

  Future<bool> _onMethodCall(MethodCall call) async {}
}
