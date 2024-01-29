import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:you_can/language/locale.dart';

class CaptionScreen extends StatelessWidget {
   CaptionScreen({super.key,required this.caption});
  String caption;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: size.width*0.05),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Text(caption,
              style: TextStyle(

                fontSize: 14.sp
              ),
            ),
          ],
        ),
      ),
    );
  }
}
