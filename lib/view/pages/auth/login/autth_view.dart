import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:you_can/core/localization/check_local.dart';
import 'package:you_can/core/size_config/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';
import 'package:you_can/view/widgets/customMainBtn.dart';
import '../../../../data/local/hiva_helper.dart';
import '../../../../provider/auth_cubit/auth_cubit.dart';
// import '../../../provider/rent_car_cubit.dart/rent_car_cubit.dart';
import 'login.dart';
import '../sign_up/sign_up.dart';
import '../widget/background.dart';

class AuthView extends StatefulWidget {
  const AuthView({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<AuthCubit>(context).getCountry();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final local = AppLocalizations.of(context)!;
    final Size size = MediaQuery.of(context).size;
    return  Scaffold(
     backgroundColor: Color(0xffF6F6F6),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal:size.width*0.05,vertical: size.height*0.07 ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: size.height*0.03,),
              SvgPicture.asset('assets/images/logo.svg'),
              SizedBox(height: 0.03.sh,),
              Text(local.signIn.toString(),style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700
              ),),
              Text(local.ContinueyourLearningJourney.toString(),style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                color: Color(0xff484848)
              ),),
              SizedBox(height: 0.03.sh,),
              const Login(),

              Row(
                children: [
                  InkWell(
                    onTap: (){
                      navigateTo(context,const SignUp());
                    },
                    child: Row(
                      children: [
                        Text(CheckLocal.isDirectionRTL(context)?"ليس لديك حساب ؟ انشئ حساب الآن":"Don't Have Account ?",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                        Text(CheckLocal.isDirectionRTL(context)?"انشئ حساب":"Sign Up",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            color: Color(0xff006FF1)
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
