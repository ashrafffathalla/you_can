import 'package:flutter/material.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk.dart';

class ZoomVideoSdkProvider extends StatelessWidget {
  const ZoomVideoSdkProvider({super.key});

  @override
  Widget build(BuildContext context) {
    var zoom = ZoomVideoSdk();
    InitConfig initConfig = InitConfig(
      appGroupId: "group.test.sdk",
      domain: "zoom.us",
      enableLog: true,
    );
    zoom.initSdk(initConfig);
    return const SafeArea(
      child: Column(

      ),
    );
  }
}