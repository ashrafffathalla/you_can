import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';

import '../../../../../provider/levelsCubit/levelsCubit.dart';
import '../../../../../provider/levelsCubit/levelsStates.dart';
import '../../../../../shared/shammer_widget.dart';
import '../../../../widgets/list_of_LevelsScreen.dart';
import 'inside_screens/lessonVideo/lessonVideo.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key, this.levelName});
  final String? levelName;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    final cubit = BlocProvider.of<AllLevelsCubit>(context);
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          levelName.toString(),
        ),
      ),
      body: BlocBuilder<AllLevelsCubit,AllLevelsState>(
        builder:  (context, state) {
          if(state is GetAllLessonsLoading){
            return   Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: LoadingShimmerWidget(),
            );
          }else if(state is GetAllLessonsError){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.error.toString(),style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),),
                  ],
                ),
              ],
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: size.width*0.03),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(locale!.lessons.toString()),
                      Text('(${cubit.lessonsByLevelModel!.data!.length.toString()})')
                    ],
                  ),
                     SizedBox(
                      height: size.height/1.2,
                      child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  navigateTo(context, LessonVideoScreen(
                                    assignments: cubit.lessonsByLevelModel!.data![index].assignments,
                                    caption:  cubit.lessonsByLevelModel!.data![index].description,
                                    comments: cubit.lessonsByLevelModel!.data![index].comments,
                                    lessonName: cubit.lessonsByLevelModel!.data![index].title,
                                    LessonNumber: cubit.lessonsByLevelModel!.data![index].id.toString(),
                                    teacher: cubit.lessonsByLevelModel!.data![index].teacher!.fullName,
                                    video:  cubit.lessonsByLevelModel!.data![index].media![0].path,
                                  ));
                                },
                                child: ListLevelsScreen(title: '${index+1}: '+cubit.lessonsByLevelModel!.data![index].title.toString(),image: 'assets/images/play.svg',subTitle: cubit.lessonsByLevelModel!.data![index].description.toString(),));
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: Colors.transparent,
                            );
                          },
                          itemCount: cubit.lessonsByLevelModel!.data!.length),
                    ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
