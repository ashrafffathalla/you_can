// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Zoom WebView'),
//         ),
//         body: WebViewWidget(),
//       ),
//     );
//   }
// }
//
// class WebViewWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return WebViewWidget(
//       initialUrl: 'https://www.example.com', // Initial URL to load
//       javascriptMode: JavascriptMode.unrestricted,
//       navigationDelegate: (NavigationRequest request) {
//         // Check if the URL has the zoomus:// scheme
//         if (request.url.startsWith('zoomus://')) {
//           // Handle the Zoom URL here
//           // You can launch the Zoom app, or display a message to the user
//           _launchZoomMeeting(request.url);
//           // Return NavigationDecision.prevent to prevent loading the URL in the WebView
//           return NavigationDecision.prevent;
//         }
//         // Allow loading all other URLs
//         return NavigationDecision.navigate;
//       },
//     );
//   }
//
//   Future<void> _launchZoomMeeting(String url) async {
//     try {
//       await  launchUrl(url);
//     } catch (e) {
//       print("Error launching the Zoom meeting URL: $e");
//     }
//   }
// }
//
//
//
//
//
//
//
//
// //
// // import 'dart:async';
// // import 'package:flutter_zoom_sdk/zoom_view.dart';
// // import 'package:flutter_zoom_sdk/zoom_options.dart';
// // import 'package:flutter/material.dart';
// //
// //
// // class joinclass extends StatefulWidget {
// //     late ZoomOptions? zoomoptions;
// //     late ZoomMeetingOptions ?meetingoptions;
// //     late Timer? timer;
// //    joinclass({super.key,this.meetingoptions,this.timer,this.zoomoptions});
// //
// //   @override
// //   State<joinclass> createState() => _joinclassState();
// // }
// //
// // class _joinclassState extends State<joinclass> {
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     widget.zoomoptions =  new ZoomOptions(
// //       domain: "zoom.us",//here should be domain
// //       appKey: "rrsxnxnhgnxhhlkggm60tckvowzrakjulvrp",//app key
// //       appSecret: "fux7v05icyclclwu6prxrl0bnhbii4lndn4z",//secret key
// //     );
// //     super.initState();
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Placeholder();
// //   }
// // }
// //
// //
// // // import 'dart:async';
// // // import 'dart:io';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_zoom_sdk/zoom_view.dart';
// // // import 'package:flutter_zoom_sdk/zoom_options.dart';
// // // import 'package:get/get.dart';
// // //
// // // // ignore: must_be_immutable
// // // class joinclass extends statelesswidget {
// // //
// // //   late zoomoptions zoomoptions;
// // //   late zoommeetingoptions meetingoptions;
// // //
// // //   late Timer timer;
// // //
// // //   joinclass({key? key, meetingid, meetingpassword,username}) : super(key: key) {
// // //
// // //     this.zoomoptions = new zoomoptions(
// // //       domain: "zoom.us",//here should be domain
// // //       appkey: "rrsxnxnhgnxhhlkggm60tckvowzrakjulvrp",//app key
// // //       appsecret: "fux7v05icyclclwu6prxrl0bnhbii4lndn4z",//secret key
// // //     );
// // //     this.meetingoptions = new zoommeetingoptions(
// // //         userid: username, //pass username for join meeting only
// // //         meetingid: meetingid, //pass meeting id for join meeting only
// // //         meetingpassword: meetingpassword, //pass meeting password for join meeting only
// // //         disabledialin: "true",
// // //         disabledrive: "true",
// // //         disableinvite: "true",
// // //         disableshare: "true",
// // //         disabletitlebar: "false",
// // //         viewoptions: "true",
// // //         noaudio: "false",
// // //         nodisconnectaudio: "false"
// // //     );
// // //   }
// // //
// // //   bool _ismeetingended(string status) {
// // //     var result = false;
// // //
// // //     if (platform.isandroid)
// // //       result = status == "meeting_status_disconnecting" || status == "meeting_status_failed";
// // //     else
// // //       result = status == "meeting_status_idle";
// // //
// // //     return result;
// // //   }
// // //
// // //
// // //
// // //   @override
// // //   widget build(buildcontext context) {
// // //     // use the todo to create the ui.
// // //     return scaffold(
// // //       appbar: appbar(
// // //         backgroundcolor:color(0xff5d1445),
// // //         title: text('loading meeting '),
// // //       ),
// // //       body: padding(
// // //           padding: edgeinsets.all(16.0),
// // //           child: zoomview(onviewcreated: (controller) {
// // //
// // //             print("created the view");
// // //
// // //             controller.initzoom(this.zoomoptions)
// // //                 .then((results) {
// // //
// // //               print("initialised");
// // //               print(results);
// // //
// // //               if(results[0] == 0) {
// // //
// // //                 controller.zoomstatusevents.listen((status) {
// // //                   //    print("meeting status stream: " + status[0] + " - " + status[1]);
// // //                   if (_ismeetingended(status[0])) {
// // //
// // //                     timer.cancel();
// // //                     get.tonamed('/home',);
// // //
// // //                   }
// // //                 });
// // //
// // //                 print("listen on event channel");
// // //
// // //                 controller.joinmeeting(this.meetingoptions)
// // //                     .then((joinmeetingresult) {
// // //
// // //                   timer = timer.periodic(new duration(seconds: 2), (timer) {
// // //                     controller.meetingstatus(this.meetingoptions.meetingid!)
// // //                         .then((status) {
// // //                       //  message('sdfdfd');
// // //                       print("meeting status polling: " + status[0] + " - " + status[1]);
// // //                     });
// // //                   });
// // //
// // //                 });
// // //               }
// // //
// // //             }).catcherror((error) {
// // //               message(error);
// // //               //   print("error");
// // //               print(error);
// // //             });
// // //           })
// // //       ),
// // //     );
// // //   }
// // //
// // // }