# flutter_jsbridge

flutter jsbridge plugin

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Usage
Add `flutter_jsbridge` as a [dependency in your pubspec.yaml file](https://pub.dev/packages/flutter_jsbridge).
```
dependencies:
  flutter_jsbridge: ^0.0.1
```
### Init JsBridge and register handler

```
...
final JsBridge _jsBridge = JsBridge();
...
WebView(
    initialUrl: "https://www.adger.me}",
    javascriptMode: JavascriptMode.unrestricted,
    onWebViewCreated: (WebViewController webViewController) async {
        _jsBridge.loadJs(webViewController);
        _controller.complete(webViewController);
        _jsBridge.registerHandler("getToken", onCallBack: (data, func) {
            // return token to js
            func({"token": "token"});
        });
        _jsBridge.registerHandler("IAPpayment", onCallBack: (data, func) {
            print("js call flutter iap");
        });
        _jsBridge.registerHandler("back", onCallBack: (data, func) {
            print("js call flutter back");
        });
    },
    navigationDelegate: (NavigationRequest request) {
        if (_jsBridge.handlerUrl(request.url)) {
            return NavigationDecision.navigate;
        }
        return NavigationDecision.prevent;
    },
    onPageStarted: (url) {
        _jsBridge.init();
    },
))

```

## 感谢

[flutter_jsbridge_plugin](https://pub.dev/packages/flutter_jsbridge_plugin)