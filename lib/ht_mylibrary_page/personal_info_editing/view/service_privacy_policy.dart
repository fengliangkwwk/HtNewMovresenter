import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class ServicePrivacyPolicyWidget extends StatefulWidget {
  ServicePrivacyPolicyWidget({required this.url, Key? key}) : super(key: key);
  Uri url;
  @override
  State<ServicePrivacyPolicyWidget> createState() => _ServicePrivacyPolicyWidgetState();
}

class _ServicePrivacyPolicyWidgetState extends State<ServicePrivacyPolicyWidget> {
  WebViewController _controller = WebViewController();
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            EasyLoading.show();
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            EasyLoading.dismiss();
          },
          // 拦截 url
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    loadWeb();
  }

  void loadWeb() async {
    _controller.loadRequest(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          controller: _controller,
        ),
      ),
    );
  }
}
