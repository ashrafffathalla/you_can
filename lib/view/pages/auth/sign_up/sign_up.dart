import 'dart:io';
import 'package:you_can/core/localization/check_local.dart';
import 'package:you_can/core/size_config/size_config.dart';
import 'package:you_can/provider/auth_cubit/auth_cubit.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';
import 'package:you_can/view/pages/auth/login/autth_view.dart';
import 'package:you_can/view/pages/auth/otp/otp.dart';

// import 'package:you_can/view/pages/menu/about_us/privacy_policy/privacy_policy.dart';
import 'package:you_can/view/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:you_can/view/widgets/defaultBtn.dart';
import '../../../../core/validation/form_validator.dart';

// import '../../../../data/model/country_model.dart';
import '../../../../language/locale.dart';
import '../../../../provider/auth_cubit/auth_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneController;
  late TextEditingController licenseIdController;
  late TextEditingController emailController;
  bool isAgreeTerms = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    licenseIdController = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final local = AppLocalizations.of(context);
    // BlocProvider.of<AuthCubit>(context).getCountry();
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            state.error.contains("path = ''")
                ? showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title:
                            //  Center(child: Icon(Icons.close,color: Colors.orangeAccent,)),
                            Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                                child: SvgPicture.asset(
                                    'assets/images/infoIcon.svg')),
                          ],
                        ),
                        content: Text(
                          CheckLocal.isDirectionRTL(context)
                              ? 'يجب ارفاق صورة رخصة القيادة'
                              : "driver's license must be attached",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    })
                : showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  child: Icon(
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
                                    'assets/images/infoIcon.svg')),
                          ],
                        ),
                        content: Text(
                          state.error.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    });
          }
          //  if (state is AuthError) {
          //   showDialog(
          //       context: context,
          //       builder: (_) {
          //         return AlertDialog(
          //           title:
          //           //  Center(child: Icon(Icons.close,color: Colors.orangeAccent,)),
          //           Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               Center(
          //                   child: SvgPicture.asset(
          //                       'assets/images/infoIcon.svg')),
          //             ],
          //           ),
          //           content: Text(
          //             state.error.toString(),
          //             style: TextStyle(
          //               fontSize: 14.sp,
          //               fontWeight: FontWeight.w500,
          //             ),
          //           ),
          //         );
          //       });
          // }
          if (state is AuthLoaded) {
            // BlocProvider.of<AuthCubit>(context).imagePathFace = "";
            // navigateAndFinish(context, AuthView());
            // // showDialog(
            // //     context: context,
            // //     builder: (context) {
            // //       Future.delayed(Duration(seconds: 3), () {
            // //         Navigator.pop(context);
            // //       });
            // //       return AlertDialog(
            // //         title:
            // //             //  Center(child: Icon(Icons.close,color: Colors.orangeAccent,)),
            // //             Column(
            // //           mainAxisAlignment: MainAxisAlignment.center,
            // //           crossAxisAlignment: CrossAxisAlignment.center,
            // //           children: [
            // //             Center(
            // //                 child: Icon(
            // //               Icons.check_circle,
            // //               color: Colors.green,
            // //               size: 50.sp,
            // //             )),
            // //           ],
            // //         ),
            // //         content: Text(
            // //           CheckLocal.isDirectionRTL(context)
            // //               ? 'تم انشاء البريد الالكتروني بنجاح'
            // //               : 'Email has been created successfully',
            // //           textAlign: TextAlign.center,
            // //           style: TextStyle(
            // //             fontSize: 16.sp,
            // //             fontWeight: FontWeight.w600,
            // //           ),
            // //         ),
            // //       );
            // //     });
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => OTP(
            //             namePage: "signUp",
            //             phone: phoneController.text,
            //           )),
            // );
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<AuthCubit>(context);
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.07),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      SvgPicture.asset('assets/images/logo.svg'),
                      SizedBox(
                        height: 0.03.sh,
                      ),
                      Text(
                        local!.createEmailAndPassword.toString(),
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        local.ContinueyourLearningJourney.toString(),
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff484848)),
                      ),
                      SizedBox(
                        height: 0.04.sh,
                      ),

                      ///-----------------------CustomTextForm--------------
                      BeforTextForm(local.fullName.toString()),
                      CustomTextFeild(
                        controller: userNameController,
                        type: TextInputType.name,
                        label: local.fullName.toString(),
                        pIcon: LineAwesomeIcons.user,
                        validat: (value) =>
                            FormValidator.nameValidate(context, value),
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),
                      BeforTextForm(local.phoneNumber.toString()),
                      CustomTextFeild(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(11),
                        ],
                        controller: phoneController,
                        type: TextInputType.phone,
                        label: CheckLocal.isDirectionRTL(context)
                            ? ' الهاتف'
                            : 'Phone',
                        pIcon: LineAwesomeIcons.mobile_phone,
                        validat: (value) =>
                            FormValidator.phoneValidate(context, value),
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),
                      BeforTextForm('Gander'.toString()),
                      SizedBox(
                        height: 50.h,
                        child: Column(
                          children: [
                            Container(
                              width: 343.w,
                              height: 42.h,
                              decoration: BoxDecoration(
                                color: Color(0xff767680).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8.sp),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                child: TabBar(
                                  controller: _tabController,
                                  indicatorColor: Colors.transparent,
                                  padding: EdgeInsets.zero,
                                  indicatorWeight: 1,
                                  labelColor: Colors.black,
                                  tabs: [
                                    Container(
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            color: _tabController.index == 0
                                                ? Colors.white
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Tab(
                                          text: 'Male',
                                        )),
                                    Container(
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            color: _tabController.index == 1
                                                ? Colors.white
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Tab(text: 'Female')),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize! * 1,
                      ),
                      BeforTextForm(local.password.toString()),
                      CustomTextFeild(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        label: local.password!,
                        pIcon: LineAwesomeIcons.lock,
                        validat: (value) =>
                            FormValidator.passwordValidate(context, value),
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),
                      BeforTextForm(local.password.toString()),
                      CustomTextFeild(
                        controller: confirmPasswordController,
                        type: TextInputType.visiblePassword,
                        label: local.confirmPassword!,
                        pIcon: LineAwesomeIcons.lock,
                        validat: (value) =>
                            FormValidator.passwordConfirmValidate(
                          context,
                          passwordController.text,
                          value,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),
                      SizedBox(
                        height: Platform.isIOS
                            ? SizeConfig.defaultSize! * 1
                            : SizeConfig.defaultSize! * .5,
                      ),

                      ///------------------Agree Terms
                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Theme(
                            data: ThemeData(
                                primarySwatch: Colors.amber,
                                unselectedWidgetColor:
                                    Theme.of(context).colorScheme.primary),
                            child: Transform.scale(
                              scale: 1,
                              child: Checkbox(
                                  value: isAgreeTerms,
                                  onChanged: (value) {
                                    setState(() {
                                      isAgreeTerms = value!;
                                      print(isAgreeTerms.toString());
                                    });
                                  }),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (_) => PrivacyPolicy()));
                            },
                            child: Text(
                              local.agreeTermsAndConditions.toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Platform.isIOS
                            ? SizeConfig.defaultSize! * 1
                            : SizeConfig.defaultSize! * 0.5,
                      ),
                      */
                      state is AuthLoading
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : DefaultAppButton(
                              onTap: () {
                                if (_formKey.currentState!.validate() &&
                                    isAgreeTerms == true) {
                                  // await cubit.signUp(
                                  //   name: userNameController.text,
                                  //   email: emailController.text,
                                  //   phone: phoneController.text,
                                  //   password: passwordController.text,
                                  //   licenseID: licenseIdController.text,
                                  //   country: 1,
                                  //   // country: countryModel!.id
                                  // );
                                }
                              },
                              height: 51.h,
                              width: size.width,
                              btnTitle: local.createEmailAndPassword),
                      SizedBox(height: 50.sp),
                      // SizedBox(
                      //   height: SizeConfig.defaultSize! * 0.05,
                      // )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget BeforTextForm(title) => Column(
        children: [
          Row(
            children: [
              Text(title.toString(),
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      );
}
