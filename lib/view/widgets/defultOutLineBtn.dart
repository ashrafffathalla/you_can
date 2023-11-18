import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/localization/check_local.dart';

class DefaultAppOutLineButton extends StatelessWidget {
  const DefaultAppOutLineButton({Key? key,required this.onTap,required this.height,required this.width,required this.btnTitle})
      : super(key: key);
  final  String? btnTitle;
  final  double height;
  final  double width;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
           border: Border.all(color: Theme.of(context).colorScheme.primary,width: 1.2)
        ),
        child: Center(
          child: Text(
            btnTitle!,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );
  }
}
