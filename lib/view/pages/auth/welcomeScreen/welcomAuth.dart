import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';
import 'package:you_can/view/pages/auth/welcomeScreen/selectAccountType.dart';
import 'package:you_can/view/widgets/defaultBtn.dart';
import 'package:you_can/view/widgets/defultOutLineBtn.dart';

class WelcomeAuth extends StatelessWidget {
  const WelcomeAuth({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final local = AppLocalizations.of(context);
    return Scaffold(
      body:Padding(
        padding:  EdgeInsets.symmetric(horizontal: size.width*0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/YCLogo.svg'),
            SizedBox(height: size.height*0.1,),
            DefaultAppButton(onTap: (){
              navigateTo(context, SelectAccountType());
            }, height: 51.h, width: size.width, btnTitle: local!.createEmailAndPassword.toString()),
            SizedBox(height: size.height*0.03,),
            DefaultAppOutLineButton(onTap: (){}, height: 51.h, width: size.width, btnTitle: local.signIn.toString())
          ],
        ),
      ),
    );
  }
}
