import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardPersonalData extends StatelessWidget {
  String title;
  String subTitle;
  IconData icon;
   CardPersonalData({super.key,required this.title,required this.subTitle,required this.icon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5.0.h),
      child: Container(
        width: size.width,
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp),
            color:Colors.white,
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(icon,color: Theme.of(context).colorScheme.primary,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: size.width*0.01),
                    child: Text(title,style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp
                    ),),
                  )
                ],
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Text(subTitle,style: TextStyle(
                  fontSize: 16.sp,
                   fontWeight: FontWeight.w400
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
