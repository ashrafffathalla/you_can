import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:you_can/language/locale.dart';

class ListLevelsScreen extends StatelessWidget {
  const ListLevelsScreen({super.key,required this.title,required this.image,required this.subTitle});
  final String title;
  final String image;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    return Container(
      height:75.h,
      width: MediaQuery.of(context).size.width/1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: size.width*0.015),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(subTitle,
                  style: TextStyle(
                      color: Color(0xff7D7D7D),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Spacer(),
            SvgPicture.asset(image),
          ],
        ),
      ),
    );;
  }
}
