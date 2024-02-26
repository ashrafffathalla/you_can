
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:you_can/language/locale.dart';
import '../../../../../core/constant/lang_code.dart';
import '../../../../../core/validation/form_validator.dart';
import '../../../../../data/local/hiva_helper.dart';

import 'dart:math' as math;
import 'dart:ui' as ui;

import '../../../../core/localization/check_local.dart';
import '../../../../core/size_config/size_config.dart';
import '../../../../provider/auth_cubit/auth_cubit.dart';
import '../../../../provider/profile_cubit/profile_cubit.dart';
import '../../../../shared/shared_commponents/commponents.dart';
import '../../../widgets/custom_text_field_infouser.dart';
import '../../auth/login/autth_view.dart';
import '../layout.dart';
import 'acc_ingo_container.dart';
class AccountInfo extends StatefulWidget {
  AccountInfo({Key? key}) : super(key: key);

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  String? token = HiveHelper().getData("token");
  late var userNameController = TextEditingController();

  late var passwordController = TextEditingController();


  bool switchValue = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProfileCubit>(context);
    final local = AppLocalizations.of(context);
    var cubit2 = BlocProvider.of<AuthCubit>(context);
    return Stack(
      children: [
        Container(
          // color: Theme.of(context).colorScheme.background,
          color: Colors.red,
          height:MediaQuery.of(context).size.height,
          width: double.infinity,
        ),
        GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus( FocusNode());
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 30.sp,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              actions: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15.sp),
                  child: InkWell(
                    onTap: (){
                      _formKey.currentState!.validate();
                      BlocProvider.of<ProfileCubit>(context)
                          .updateAllFieldsAccInfo(
                        name: userNameController.text,
                        password: passwordController.text,

                      );
                    },
                    child: Center(
                        child: Text(
                          local!.save.toString(),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ],
              toolbarHeight: MediaQuery.of(context).size.height * 0.08,
              backgroundColor: Colors.white.withOpacity(0),
            ),
            body: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is ProfileError) {
                   showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          content: Text(state.error.toString()),
                        );
                      });
                }else if  (state is UpdateAllProfileLoaded) {
                  showDialog(
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
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.black87,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                              const Center(
                                  child:  Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: 30,
                                  )),
                            ],
                          ),
                          content: Text(CheckLocal.isDirectionRTL(context)?'تم تحديث معلومات الحساب ':'Account Information Updated',textAlign: TextAlign.center,),
                        );
                      });
                }
                if (state is UpdateProfileError) {
                  BlocProvider.of<ProfileCubit>(context).getProfileData();
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                  child: Icon(Icons.info)
                              ),
                            ],
                          ),
                          content: Text(
                            state.error.toString(),
                            textAlign: TextAlign.center,
                          ),
                        );
                      });
                }
                if (state is ProfileLoaded) {
                  userNameController.text = state.profileListData.data!.fullName!;
                }

                if (state is UpdateProfileLoaded||state is UpdateAllProfileLoaded) {
                  BlocProvider.of<ProfileCubit>(context).getProfileData().then((value) {
                    //Navigator.pop(context);
                  });
                }
              },
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return SingleChildScrollView(
                  // physics: BouncingScrollPhysics(),
                  child: GestureDetector(
                    onTap:(){FocusScope.of(context).requestFocus( FocusNode());},
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.defaultSize! * 1,
                          ),
                          // Center(
                          //   child: Text(
                          //     local!.accountInfo.toString(),
                          //     overflow: TextOverflow.ellipsis,
                          //     style: TextStyle(
                          //       fontSize: 20.sp,
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.black,
                          //     ),
                          //   ),
                          // ),


                          SizedBox(
                            height: 15.sp,
                          ),
                          Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Column(
                              children: [

                                AccountInfoContainer(
                                  isPasswordScreen: true,
                                  isEdit: true,
                                  containerIcon: Icons.account_box,
                                  widget: CustomTextFeildAccInfo(
                                    controller: userNameController,
                                    type: TextInputType.name,
                                    label:' local.editName',
                                  ),
                                ),
                                AccountInfoContainer(
                                  isPasswordScreen: true,
                                  isEdit: true,
                                  containerIcon: Icons.password,
                                  widget: CustomTextFeildAccInfo(
                                    controller: passwordController,
                                    type: TextInputType.visiblePassword,
                                    label:'',
                                  ),
                                ),
                          //       Row(
                          //         children: [
                          //           Padding(
                          //             padding: EdgeInsets.symmetric(
                          //                 horizontal: MediaQuery.of(context).size.width * 0.05),
                          //             child: Text(
                          //               local.emailAddress,
                          //               style: TextStyle(
                          //                 fontSize: 14.sp,
                          //                 color: Color(0xff424242),
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //       AccountInfoContainer(
                          //         isPasswordScreen: true,
                          //
                          //         isEdit: true,
                          //         containerIcon: Icons.mail,
                          //         widget: CustomTextFeildAccInfo(
                          //           controller: emailController,
                          //           type: TextInputType.name,
                          //           label: local.editName,
                          //         ),
                          //       ),
                          //       Row(
                          //         children: [
                          //           Padding(
                          //             padding: EdgeInsets.symmetric(
                          //                 horizontal:
                          //                 MediaQuery.of(context).size.width * 0.05),
                          //             child: Text(
                          //                 local.phoneNumber,
                          //                 style: TextStyle(
                          //                     fontSize: 14.sp,
                          //                     color: const Color(0xff424242))),
                          //           ),
                          //         ],
                          //       ),
                          //       AccountInfoContainer(
                          //         isPasswordScreen: true,
                          //         isEdit: true,
                          //         containerIcon: Icons.phone,
                          //         widget: Directionality(
                          //           textDirection: ui.TextDirection.rtl,
                          //           child: CustomTextFeildAccInfo(
                          //             inputFormatters: [
                          //               LengthLimitingTextInputFormatter(9),
                          //             ],
                          //             validat: (value) =>
                          //                 FormValidator.phoneValidate(context, value),
                          //             controller: phoneController,
                          //             type: TextInputType.phone,
                          //             label: local.editName,
                          //           ),
                          //         ),
                          //       ),
                          //
                          //
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                      ],
                  ),
                  )
                )
                );

              },
            ),
          ),
        ),
      ],
    );
  }

  Future<DateTime?> pickDate({
    required bool birthdate,
  }) => showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: birthdate?DateTime(1950,1):DateTime.now().subtract(const Duration(days: 0)),
    lastDate: DateTime(2100),
  );



}
