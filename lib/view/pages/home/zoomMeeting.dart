import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ZoomMeetingPage extends StatefulWidget {
  final dynamic meetingLink;

  ZoomMeetingPage({required this.meetingLink});

  @override
  _ZoomMeetingPageState createState() => _ZoomMeetingPageState();
}

class _ZoomMeetingPageState extends State<ZoomMeetingPage> {

  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            print('HHH');
          },
          onNavigationRequest: (NavigationRequest request) {
            //if (request.url.startsWith(widget.url.toString())) {
            //   return NavigationDecision.prevent;
            // }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.meetingLink.toString()));
    return Scaffold(
      appBar: AppBar(
        title: Text('Zoom Meeting'),
      ),
      body:
      WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: SafeArea(
          child: widget.meetingLink != null
              ? Stack(
            children: [
              WebViewWidget(controller: controller,),

              // WebView(
              //   initialUrl: widget.url,
              //   javascriptMode: JavascriptMode.unrestricted,
              //   onProgress: (value) => setState(() => loading = value),
              //   onPageFinished: (value) {
              //     setState(() {
              //     });
              //   },
              // ),

            ],
          )
              : Container(),
        ),
      ),
    );
  }
}
