import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationShapeWidget extends StatelessWidget {
   NotificationShapeWidget({super.key,required this.svg,required this.title,required this.desc});
  String svg;
  String title;
  String desc;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width:size.width,
      height: 88.h,
      decoration: BoxDecoration(),
      child:FittedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(svg),
            SizedBox(width: size.width*0.03,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),),
                Text(
                  desc,
                  style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff555E68)
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
