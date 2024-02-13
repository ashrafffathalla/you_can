import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
          onPageStarted: (String url) {
            if (widget.meetingLink.contains('zoom')) {
              // Handle the Zoom URL here
              // You can launch the Zoom app, or display a message to the user
              _launchZoomMeeting(widget.meetingLink);
              // Return NavigationDecision.prevent to prevent loading the URL in the WebView
              // return NavigationDecision.prevent;
            }
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(Uri.parse(widget.meetingLink).toString())) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
       ..loadRequest(Uri.parse('https://www.google.com'.toString())
      );
    return Scaffold(
      appBar: AppBar(
        title: Text('Zoom Meetings'),
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
Future<void> _launchZoomMeeting(url) async {
  try {
    print("FFFF");
    await  launchUrl(Uri.parse(url));
  } catch (e) {
    print("Error launching the Zoom meeting URL: $e");
  }
}
