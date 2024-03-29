import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:you_can/data/model/lessonsByLevelModel.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/provider/profile_cubit/profile_cubit.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';
import 'package:you_can/view/pages/home/layout.dart';
import 'package:you_can/view/pages/home/lectures/lessonsScreen/inside_screens/lessonVideo/assignment.dart';
import 'package:you_can/view/pages/home/lectures/lessonsScreen/inside_screens/lessonVideo/captionScreen.dart';
import 'package:you_can/view/pages/home/lectures/lessonsScreen/inside_screens/lessonVideo/comments.dart';
import 'package:you_can/view/homeWork.dart';

import '../../../../../../../provider/levelsCubit/levelsCubit.dart';

class LessonVideoScreen extends StatefulWidget {
   LessonVideoScreen({super.key,this.assignments,this.caption,this.comments,this.lessonName,this.LessonNumber,this.teacher,this.video});
  String? lessonName;
  dynamic LessonNumber;
  String? teacher ;
  String? caption;
  List? comments;
   List<Assignments>?assignments;
  dynamic video;
  @override
  State<LessonVideoScreen> createState() => _LessonVideoScreenState();
}

class _LessonVideoScreenState extends State<LessonVideoScreen> {
   CustomVideoPlayerController? _customVideoPlayerController;
   late VideoPlayerController? videoPlayerController;
   late bool isVideoInitialized = false;


  @override
  void initState() {
    super.initState();
    initializeVideoPlayer(widget.video);
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    final cubit = BlocProvider.of<AllLevelsCubit>(context);
    return DefaultTabController(
      length: 3,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    child:isVideoInitialized?CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController!):Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: size.width,
                        height: 200.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0.sp)),
                      ),
                    ),
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
                            Text(widget.lessonName.toString(),
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
                                child: Text('LEVEL ${widget.LessonNumber}',style: TextStyle(
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
                            Text('Mr. ${widget.teacher!}',style: TextStyle(
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
                           if(index==2){
                             print(index.toString()+"HHH");
                             widget.assignments=cubit.lessonsByLevelModel!.data![0].assignments;

                           }
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
                          Center(child: FittedBox(child: GestureDetector(
                              onTap: () {
                                // print(BlocProvider.of<ProfileCubit>(context).profileListProfileData!.data!.phone.toString());
                            navigateTo(context, QuestionScreen(assignments: widget.assignments,));
                          }, child: Text("Assignment",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp),)))),

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
                        CaptionScreen(caption: widget.caption!),
                        CommentsScreen(comments: widget.comments!,LessonId: widget.LessonNumber),
                        // QuestionScreen(assignments: widget.assignments,),
                        SizedBox()
                        // Container(),
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

  void initializeVideoPlayer(String video) {
    VideoPlayerController _videoPlayerController;
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(video),
    )
      ..initialize().then((value) {
        setState(() {
          isVideoInitialized = true;
        });
      });
    _customVideoPlayerController = CustomVideoPlayerController(context: context, videoPlayerController: _videoPlayerController);
  }
}
