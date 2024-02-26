import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/provider/levelsCubit/levelsCubit.dart';
import 'package:you_can/provider/levelsCubit/levelsStates.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';
import 'package:you_can/view/pages/home/lectures/lessonsScreen/lessons.dart';
import 'package:you_can/view/pages/home/zoomMeeting.dart';
import 'package:you_can/view/widgets/defaultBtn.dart';
import '../../../../shared/shammer_widget.dart';
import 'notification/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    final cubit = BlocProvider.of<AllLevelsCubit>(context);
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      appBar: AppBar(
        title: SvgPicture.asset('assets/images/logo.svg'),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 15.w),
        //     child: InkWell (onTap: () {
        //       navigateTo(context, NotificationScreen());
        //     },child: Icon(Icons.notifications)),
        //   ),
        // ],
      ),
      body: BlocBuilder<AllLevelsCubit, AllLevelsState>(
        builder: (context, state) {
          if (state is GetAllLevelsLoading || cubit.levelsModel == null) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: LoadingShimmerWidget(),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: 180,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        viewportFraction: 0.9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        disableCenter: true,
                      ),
                      items: [
                        Stack(
                          children: [
                            Image.asset(
                              'assets/images/home.png',
                            ),
                            Positioned(
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Text(
                                      'SAVE UP',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff484848),
                                      ),
                                    ),
                                    Text(
                                      'On Level 1',
                                      style: TextStyle(
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff484848),
                                      ),
                                    ),
                                    Text(
                                      'Get 20% off with your invite',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff007AFF),
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.005,
                                    ),
                                    DefaultAppButton(
                                        onTap: () {

                                        },
                                        height: 36.h,
                                        width: 126.w,
                                        btnTitle: 'Invite'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  ///---------------End Carusal Slider---------
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        locale!.liveLectures.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  cubit.onlineMeeting !=null?InkWell(
                      onTap: ()async {
                         await cubit.getOnlineLesson(cubit.levelsModel!.data![0].id);
                         navigateTo(context, ZoomMeetingPage(meetingLink: cubit.onlineMeeting!.data!.joinUrl.toString()));
                      },
                      child: Image.asset('assets/images/video.png')):SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        locale.levels.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      // Text(
                      //   locale.seeAll.toString(),
                      //   style: TextStyle(
                      //       color: Color(0xff007AFF),
                      //       fontSize: 12.sp,
                      //       fontWeight: FontWeight.w700),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  SizedBox(
                    height: size.height / 1.3,
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () async {
                              cubit.getAllLessons(index + 1);
                              cubit.levelsModel!.data![index].isOpen == 1
                                  ? navigateTo(
                                      context,
                                      LessonsScreen(
                                        levelName: cubit
                                            .levelsModel!.data![index].name
                                            .toString(),
                                      ))
                                  : false;
                            },
                            child: listOfLevels(
                                locale,
                                context,
                                cubit.levelsModel!.data![index].name.toString(),
                                cubit.levelsModel!.data![index].isOpen));
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.transparent,
                        );
                      },
                      itemCount: cubit.levelsModel!.data!.length,
                    ),
                  ),
                  SizedBox(height: size.height*0.1,)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget listOfLevels(locale, context, String levelName, dynamic isLock) =>
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      height: 75.h,
      width: MediaQuery.of(context).size.width / 1,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  levelName,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                // Text(locale!.liveLectures.toString(), textAlign: TextAlign.start, style: TextStyle(color: Color(0xff7D7D7D), fontSize: 13.sp, fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: SvgPicture.asset(isLock == 0
                ? 'assets/images/lock.svg'
                : 'assets/images/arrow.svg'),
          ),
        ],
      ),
    );
