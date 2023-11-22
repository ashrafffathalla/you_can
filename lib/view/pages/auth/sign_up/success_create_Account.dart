import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';
import 'package:you_can/view/pages/home/layout.dart';
import 'package:you_can/view/widgets/defultOutLineBtn.dart';

class SuccessCreateAccount extends StatelessWidget {
  const SuccessCreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    final local = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size.width*0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.08,
              ),
              SizedBox(
                  width:73.w,
                  height: 79.h,
                  child: SvgPicture.asset('assets/images/YCLogo.svg')),
              SizedBox(
                height: 0.1.sh,
              ),
              SvgPicture.asset('assets/images/done.svg'),
              SizedBox(
                height: 0.03.sh,
              ),
              Text(local!.accountVerified.toString(),style: TextStyle(
                fontSize: 21.sp,
                fontWeight: FontWeight.w700,
              ),),
              Text(local.successfullyVerified.toString(),style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff303030)
              ),),
              SizedBox(
                height: 0.05.sh,
              ),
              DefaultAppOutLineButton(onTap: (){
                navigateTo(context, LayoutScreen());
              }, height: 51.h, width: size.width, btnTitle: local.done.toString())
            ],
          ),
        ),
      ),
    );
  }
}
