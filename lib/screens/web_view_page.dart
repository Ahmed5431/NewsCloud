import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final String url;
  WebViewPage({super.key,required this.url});
  late WebViewController controller = WebViewController()..loadRequest(Uri.parse(url));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              "Cloud",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: Container(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
