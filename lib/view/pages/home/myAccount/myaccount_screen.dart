import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/provider/profile_cubit/profile_cubit.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';
import 'package:you_can/view/pages/home/myAccount/edit_account.dart';
import 'package:you_can/view/pages/home/myAccount/exam_results_screen.dart';
import 'package:you_can/view/pages/home/myAccount/paymentHistory_Screen.dart';
import 'package:you_can/view/widgets/card_personalData.dart';

import '../../../../shared/shammer_widget.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String code = "S0172940xc";
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    var cubit = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        actions: [
          InkWell(
            onTap: (){
              navigateTo(context, AccountInfo());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.h),
              child: Center(
                child: Text(
                  'Edit',
                  style:
                      TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<ProfileCubit,ProfileState>(
       builder:  (context, state) {
         if(state is ProfileLoading){
           return   Shimmer.fromColors(
             baseColor: Colors.grey[300]!,
             highlightColor: Colors.grey[100]!,
             child: LoadingShimmerWidget(),
           );
         }
         return SingleChildScrollView(
           child: Padding(
             padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
             child: Column(
               children: [
                 CardPersonalData(
                     title: locale!.fullName.toString(),
                     subTitle: cubit.profileListProfileData!.data!.fullName.toString(),
                     icon: Icons.person),
                 CardPersonalData(
                     title: locale.phoneNumber.toString(),
                     subTitle: cubit.profileListProfileData!.data!.phone.toString(),
                     icon: Icons.phone),
                 CardPersonalData(
                     title: cubit.profileListProfileData!.data!.gender.toString(),
                     subTitle: 'Male',
                     icon: Icons.male_outlined),
                 CardPersonalData(
                     title: 'Code'.toString(),
                     subTitle: cubit.profileListProfileData!.data!.code.toString(),
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
         );
       },
      ),
    );
  }
}
