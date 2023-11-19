
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';
import 'package:you_can/view/pages/auth/login/autth_view.dart';

import '../../../widgets/defaultBtn.dart';
import '../../../widgets/defultOutLineBtn.dart';

class SelectAccountType extends StatefulWidget {
  @override
  _SelectAccountTypeState createState() => _SelectAccountTypeState();
}

class _SelectAccountTypeState extends State<SelectAccountType> {
  bool ?option1Selected = false;
  bool ?option2Selected = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final local = AppLocalizations.of(context);
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: size.width*0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(local!.chooseRole!,style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700
            ),),
            SizedBox(height: size.height*0.1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if(option1Selected==false){
                        option1Selected=true;
                        option2Selected=false;
                      }else if(option1Selected==true){
                        option1Selected =false;
                      }
                    });
                    print(option1Selected.toString());
                  },
                  child:  Container(
                    width: size.width*0.4,
                    child: Image.asset('assets/images/student.png'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.sp),
                      border:Border.all(color: option1Selected==true? Theme.of(context).colorScheme.primary:Colors.transparent,
                        width: 3,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                   setState(() {
                     if(option2Selected==false){
                       option2Selected=true;
                       option1Selected=false;
                     }else if(option2Selected==true){
                       option2Selected =false;
                     }
                   });
                  },
                  child:  Container(
                    width: size.width*0.4,
                    child: Image.asset('assets/images/teatcher.png'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.sp),
                      border: Border.all(color: option2Selected==true? Theme.of(context).colorScheme.primary:Colors.transparent,
                        width: 3,
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: size.height*0.1,),
            DefaultAppButton(onTap: (){
              navigateTo(context, AuthView());
            }, height: 51.h, width: size.width, btnTitle: local.selectAccountType.toString())
          ],
        ),
      ),
    );
  }
}