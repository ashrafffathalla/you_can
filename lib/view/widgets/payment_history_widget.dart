import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentHistoryWidget extends StatelessWidget {
  String Description;
  String Date;
  String paymentMethod;
  String cache;
  IconData icon;
   PaymentHistoryWidget({super.key, required this.icon,required this.cache,required this.Date,required this.Description,required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      height: 60.h,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: size.width*0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(Description,style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),),
            Text(Date,style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              color: Color(0xff707070)
            ),),
          Row(
            children: [
              Icon(icon),
              Text(paymentMethod,style: TextStyle(
                fontSize: 12.sp,
              ),),
            ],
          ),
            Text(cache,style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.green
            ),),
          ],
        ),
      ),
    );
  }
}
