import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';
import 'package:you_can/view/pages/home/myAccount/exam_results_screen.dart';
import 'package:you_can/view/pages/home/myAccount/paymentHistory_Screen.dart';
import 'package:you_can/view/widgets/card_personalData.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String code = "S0172940xc";
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: Text(
                'Edit',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            children: [
              CardPersonalData(
                  title: locale!.fullName.toString(),
                  subTitle: 'Ashraf Fathalla',
                  icon: Icons.person),
              CardPersonalData(
                  title: locale.phoneNumber.toString(),
                  subTitle: '01012406593',
                  icon: Icons.phone),
              CardPersonalData(
                  title: 'Gender'.toString(),
                  subTitle: 'Male',
                  icon: Icons.male_outlined),
              CardPersonalData(
                  title: 'Code'.toString(),
                  subTitle: '12-66-554',
                  icon: FontAwesomeIcons.idBadge),
              CardPersonalData(
                  title: locale.password.toString(),
                  subTitle: '*******',
                  icon: Icons.lock),
              GestureDetector(
                  onTap: () {
                    navigateTo(context, PaymentHistoryScreen());
                  },
                  child: CardPersonalData(
                      title: 'Payment History'.toString(),
                      subTitle: 'Check your payments',
                      icon: Icons.monetization_on)),
              GestureDetector(
                onTap: () {
                  navigateTo(context, ExamResultsScreen());
                },
                  child: CardPersonalData(
                      title: 'Exams Results'.toString(),
                      subTitle: 'Track your progress and performance',
                      icon: Icons.calendar_month)),
              Row(
                children: [
                  Text(
                    'Get 20% discount on your 1st level',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Column(
                children: [
                  Text(
                    'Invite your friends and get 20% off on your first level with each one joining with your referral code',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Color(0XFF505050),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Referral Code",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                code,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          GestureDetector(
                              onTap: () async {
                                await Clipboard.setData(
                                    ClipboardData(text: code.toString()));
                                // copied successfully
                              },
                              child: Icon(
                                Icons.copy,
                                color: Theme.of(context).colorScheme.primary,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'Total Referrals',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 3.h,
                          ),
                          Text(
                            '3',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 3.h,
                          ),
                          Text(
                            '60% Saved on level 1',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
