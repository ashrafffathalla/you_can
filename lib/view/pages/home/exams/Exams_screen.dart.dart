import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:you_can/ex.dart';
import 'package:you_can/provider/exams_cubit/exams_cubit.dart';
import 'package:you_can/provider/exams_cubit/exams_states.dart';
import 'package:you_can/shared/shammer_widget.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';
import 'package:you_can/view/widgets/examWidgetShape.dart';

import '../../../../language/locale.dart';
import '../../../widgets/defaultBtn.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    var cubit = BlocProvider.of<ExamsCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Exams"),
      ),
      body: BlocBuilder<ExamsCubit, ExamsState>(
        builder: (context, state) {
          if (state is GetAllExamsLoading) {
            return LoadingShimmerWidget();
          }
          if (state is GetAllExamsError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Center(child: Text(state.error.toString()))
              ],
            );
          }
          return  SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: size.height,
                        child: ListView.separated(
                          itemCount: cubit.allExamModel!.data!.length,
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: Colors.transparent,
                            );
                          },
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        cubit.allExamModel!.data![index].name
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      // Text('23 hrs left',style: TextStyle(
                                      //     fontSize: 14.sp,
                                      //     fontWeight: FontWeight.w400,
                                      //     color: Color(0xffFD8900)
                                      // ),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/images/q.svg'),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                          '${cubit.allExamModel!.data![index].questionCount} questions'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.012,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/pace.svg'),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                          '${cubit.allExamModel!.data![index].timeToComplete} mins to complete'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.022,
                                  ),
                                  DefaultAppButton(
                                      onTap: () async{
                                        await cubit.geExamQuestion(cubit.allExamModel!.data![index].id!.toInt());
                                        navigateTo(context,  MultipleChoicePage(
                                          examName: cubit.allExamModel!.data![index].name.toString(),
                                          options: cubit.examQuestionsModel!.data!.answers!,
                                          question:  cubit.examQuestionsModel!.data!.title.toString(),
                                          questionNumber: cubit.examQuestionsModel!.data!.id.toString(),
                                          index: cubit.allExamModel!.data![index],
                                          right_answer: cubit.examQuestionsModel!.data!.rightAnswer.toString(),
                                        ));

                                      },
                                      height: 45.h,
                                      width: size.width,
                                      btnTitle: 'Start Exam')
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
