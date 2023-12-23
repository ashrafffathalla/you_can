import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultsExamWidget extends StatelessWidget {
  String Name;
  String Date;
  String Score;
  String Result;
  ResultsExamWidget({super.key,required this.Result,required this.Date,required this.Name,required this.Score});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      height: 60.h,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: size.width*0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(Name,style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),),
            Text(Date,style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
                color: Color(0xff707070)
            ),),
            Row(
              children: [
                Text(Score,style: TextStyle(
                  fontSize: 12.sp,
                ),),
              ],
            ),
            Container(
             decoration: BoxDecoration(
               color: Color(0XFF33C55826),
               borderRadius: BorderRadius.circular(6)
             ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.0.w,vertical: 1.h),
                child: Text(Result,style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.green
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
