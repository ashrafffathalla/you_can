import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:you_can/core/size_config/size_config.dart';
import 'package:you_can/data/local/hiva_helper.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/provider/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:you_can/view/widgets/defaultBtn.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;

import '../../../../core/localization/check_local.dart';
import '../../../../core/validation/form_validator.dart';
import '../../../../provider/auth_cubit/auth_state.dart';
import '../../../widgets/defultOutLineBtn.dart';
import '../../../widgets/custom_text_feild.dart';
import '../otp/otp.dart';
import '../widget/background.dart';

class ChangePassword extends StatefulWidget {

  ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // if (state is AuthError) {
          //   showDialog(
          //       context: context,
          //       builder: (_) {
          //         return AlertDialog(
          //           content: Text(state.error),
          //         );
          //       });
          // }
          if (state is AuthLoaded) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const OTP(
                          namePage: "changePassword",
                        )));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Text(
                    local!.resetPassword.toString(),
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    height: 0.03.sh,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Transform(
                        transform: CheckLocal.isDirectionRTL(context)
                            ? Matrix4.rotationX(math.pi / 90)
                            : Matrix4.rotationX(math.pi / 120),
                        child: Icon(
                          Icons.sms,
                          size: SizeConfig.defaultSize! * 6,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.defaultSize! * 1,
                      ),
                      Text(
                        local.changePassword.toString(),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 1,
                  ),

                  Form(
                    key: formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.0,
                          vertical: size.height * 0.05),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                local.phoneNumber.toString(),
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          CustomTextFeild(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(11),
                            ],
                            controller: phoneController,
                            type: TextInputType.phone,
                            label: local.pleaseEnterPhoneNumber,
                            pIcon: Icons.phone_android_outlined,
                            validat: (value) =>
                                FormValidator.phoneValidate(context, value),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 2,
                  ),
                  state is AuthLoading
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : DefaultAppButton(
                          onTap: (){
                            if (formKey.currentState!.validate()) {
                              ///-----دي حذف بعد API
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const OTP(
                                        namePage: "changePassword",
                                      )));
                              ///----------
                              // BlocProvider.of<AuthCubit>(context)
                              //     .forget(phone: phoneController.text);
                            }
                          },
                          height: 51.h,
                          width: size.width/1,
                          btnTitle: local.send.toString()),
                  // ElevatedButton.icon(
                  //     onPressed: () {
                  //       BlocProvider.of<LanguageCubit>(context)
                  //           .selectEngLanguage();
                  //     },
                  //     icon: const Icon(Icons.language),
                  //     label: const Text("Change Languagh"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
// CustomBackButton(ontap: () {
// HiveHelper().removeData("token").then((value) {
// Navigator.pop(context);
// });
// }),
