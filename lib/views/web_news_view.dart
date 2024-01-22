import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebNewsView extends StatelessWidget {
  const WebNewsView({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
