import 'package:you_can/core/localization/check_local.dart';
import 'package:you_can/core/size_config/size_config.dart';
import 'package:you_can/data/local/hiva_helper.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';
import 'package:you_can/view/pages/home/layout.dart';
import 'package:you_can/view/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:you_can/view/widgets/defaultBtn.dart';
import '../../../../core/validation/form_validator.dart';
import '../../../../language/locale.dart';
import '../../../../provider/auth_cubit/auth_cubit.dart';
import '../../../../provider/auth_cubit/auth_state.dart';
import '../forget_password/change_password.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController phoneController;
  late TextEditingController CodeController;
  late TextEditingController passwordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    CodeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 8.sp),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Text(local!.phoneNumber.toString(),
                      style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600
                  )),
                ],
              ),
              SizedBox(height: 5.h,),
              CustomTextFeild(
                controller: phoneController,
                type: TextInputType.emailAddress,
                label: local!.phoneNumber.toString(),
                validat: (value) => FormValidator.phoneValidate(context, value),
              ),
              SizedBox(height: SizeConfig.defaultSize! * 2,),
              Row(
                children: [
                  Text('Code',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600
                      )),
                ],
              ),
              SizedBox(height: 5.h,),
              CustomTextFeild(
                controller: CodeController,
                type: TextInputType.emailAddress,
                label: 'Code',
                validat: (value) => FormValidator.phoneValidate(context, value),
              ),
              SizedBox(height: SizeConfig.defaultSize! * 2,),
              Row(
                children: [
                  Text(local.password.toString(),
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600
                      )),
                ],
              ),
              SizedBox(height: 5.h,),
              CustomTextFeild(
                controller: passwordController,
                type: TextInputType.visiblePassword,
                label: local.password.toString(),
                validat: (value) =>
                    FormValidator.passwordValidate(context, value),
              ),
              ///----------------------Forget PassWord -------------
              SizedBox(height: 5.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.sp),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePassword()),
                        );
                      },
                      child: Text(
                        local.forgetPassword.toString(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                             color:const Color(0xff006FF1)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 1,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthError) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              child:const Icon(
                                                Icons.close,
                                                color: Colors.black87,
                                              ),
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                Center(
                                    child: SvgPicture.asset(
                                        'assets/images/infoIcon.svg',)),
                              ],
                            ),
                            content: Text(state.error,textAlign: TextAlign.center,),
                          );
                        });
                  }
                  if (state is AuthLoaded) {
                    if (_formKey.currentState!.validate()) {
                      //  HiveHelper().getData('number') == 1
                      //      ? Navigator.of(context).pop(true)
                      //      :
                      // Navigator.pushAndRemoveUntil(
                      //         context,
                      //         MaterialPageRoute<void>(
                      //             builder: (BuildContext context) =>
                      //                 const Home()
                      //         ),
                      //         (route) => false);
                    }
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return DefaultAppButton(onTap: (){
                    if (_formKey.currentState!.validate()) {
                      // BlocProvider.of<AuthCubit>(context).login(
                      //     email: phoneController.text,
                      //     password: passwordController.text);
                      ///-----مسح مع API
                      navigateTo(context, LayoutScreen());
                    }
                  }, height: 51.h, width: MediaQuery.of(context).size.width, btnTitle: local.signIn);

                },
              ),
              SizedBox(height: 0.03.sh,),
            ],
          ),
        ),
      ),
    );
  }
}
