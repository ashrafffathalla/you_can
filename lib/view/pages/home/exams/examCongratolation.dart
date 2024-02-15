import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:you_can/provider/exams_cubit/exams_cubit.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';
import 'package:you_can/view/pages/home/layout.dart';
import 'package:you_can/view/widgets/defaultBtn.dart';

class ExamCongratolation extends StatelessWidget {
  const ExamCongratolation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/done.png')),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Enroll The Next level within 4 days \n to continue your journey',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xff303030), fontSize: 14.sp),
          ),
          SizedBox(
            height: 60.h,
          ),
          DefaultAppButton(
              onTap: () async{
                BlocProvider.of<ExamsCubit>(context).Enrollment( BlocProvider.of<ExamsCubit>(context).allExamModel!.data![0].level!.id!+1);
                navigateTo(context, LayoutScreen());
              }, height: 51.h, width: MediaQuery.of(context).size.width/1.2, btnTitle: "Go to Next Level")
        ],
      ),
    );
  }
}
