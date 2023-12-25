import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/view/widgets/defaultBtn.dart';

class ExamWidgetShape extends StatelessWidget {
  const ExamWidgetShape({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    return Container(
     child: SingleChildScrollView(
       child: Padding(
         padding:  EdgeInsets.symmetric(horizontal: size.width*0.05),
         child: Column(
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Level one Exam',style: TextStyle(
                   fontSize: 16.sp,
                   fontWeight: FontWeight.w600,
                 ),),
                 Text('23 hrs left',style: TextStyle(
                   fontSize: 14.sp,
                   fontWeight: FontWeight.w400,
                   color: Color(0xffFD8900)
                 ),),
               ],
             ),
             SizedBox(height: size.height*0.01,),
             Row(
               children: [
                 SvgPicture.asset('assets/images/q.svg'),
                 Text('15 questions'),

               ],
             ),
             Row(
               children: [
                 SvgPicture.asset('assets/images/pace.svg'),
                 Text('25 mins to complete'),

               ],
             ),
             SizedBox(height: size.height*0.02,),
             DefaultAppButton(onTap: () {

             },  height: 45.h, width: size.width, btnTitle: 'Start Exam')
           ],
         ),
       ),
     ),
    );
  }
}
