import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/view/pages/home/lectures/lessonsScreen/inside_screens/lessonVideo/assignment.dart';
import 'package:you_can/view/pages/home/lectures/lessonsScreen/inside_screens/lessonVideo/captionScreen.dart';
import 'package:you_can/view/pages/home/lectures/lessonsScreen/inside_screens/lessonVideo/comments.dart';

import '../../../../../../../core/localization/check_local.dart';

class LessonVideoScreen extends StatefulWidget {
  const LessonVideoScreen({super.key});

  @override
  State<LessonVideoScreen> createState() => _LessonVideoScreenState();
}

class _LessonVideoScreenState extends State<LessonVideoScreen> {
   CustomVideoPlayerController? _customVideoPlayerController;
   VideoPlayerController? videoPlayerController;


  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    return DefaultTabController(
      length: 3,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController!),
                  ),
                  SizedBox(
                    height: size.height*0.02,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: size.width*0.03),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height*0.01,
                        ),
                        Row(
                          children: [
                            Text('Introduction to Grammar',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              ),),
                          ],
                        ),
                        SizedBox(
                          height: size.height*0.01,
                        ),
                        Row(
                          children: [
                            Container(
                              color: Color(0xff33C558).withOpacity(0.2),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 3.w),
                                child: Text('LEVEL 1',style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0XFF33C558),
                                ),),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text('-',style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),),
                            ),
                            Text('Mr. Anas Mohamed',style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0XFF0060D2),
                            ),),
                          ],
                        ),
                        SizedBox(
                          height: size.height*0.02,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding:  EdgeInsets.all(8.0.sp),
                      child: TabBar(
                        onTap: (index){
                          // if(index==0){BlocProvider.of<OrdersCubit>(context).getOrdersData(state: "Pending");}
                          // if(index==1){BlocProvider.of<OrdersCubit>(context).getOrdersData(state: "NotCompleted");}
                          // if(index==2){BlocProvider.of<OrdersCubit>(context).getOrdersData(state: "Completed");}
                        },
                        padding: EdgeInsets.zero,
                        indicatorColor: Theme.of(context).colorScheme.primary,
                        indicatorWeight: 3,
                        indicatorPadding: EdgeInsets.symmetric(
                          vertical: -5,
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                        ),
                        unselectedLabelColor: Colors.black,
                        labelStyle: Theme.of(context).textTheme.bodyLarge,

                        unselectedLabelStyle: Theme.of(context).textTheme.bodyLarge,
                        labelColor: Colors.black,
                        tabs: [
                          Center(child: Text('Caption',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp),)),
                          Center(child: Text('Comments',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp),)),
                          Center(child: Text("Assignment",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp),)),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  SizedBox(
                    height: size.height/2.3,
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        CaptionScreen(),
                        CommentsScreen(),
                        AssignmentScreen(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void initializeVideoPlayer() {
    VideoPlayerController _videoPlayerController;
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"))
      ..initialize().then((value) {
        setState(() {

        });
      });
    _customVideoPlayerController = CustomVideoPlayerController(context: context, videoPlayerController: _videoPlayerController);
  }
}
