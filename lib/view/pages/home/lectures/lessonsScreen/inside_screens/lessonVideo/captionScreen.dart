import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:you_can/language/locale.dart';

class CaptionScreen extends StatelessWidget {
  const CaptionScreen({super.key});

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
            Text('Lorem ipsum dolor sit amet consectetur. Mauris nibh suspendisse facilisis fermentum amet dignissim. Proin duis sodales urna lacus at dui. Bibendum quam amet quam aliquet mauris orci. Et lacus gravida ligula euismod sed semper auctor. Amet eu sit massa quis convallis.Lorem ipsum dolor sit amet consectetur. Mauris nibh suspendisse facilisis fermentum amet dignissim. Proin duis sodales urna lacus at dui.',
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
