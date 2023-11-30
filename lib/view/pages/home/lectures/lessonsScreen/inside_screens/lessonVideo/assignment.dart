import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:you_can/data/model/quistionsModel.dart';
import 'package:you_can/language/locale.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({super.key});

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  int questionNumber = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    return Container(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: size.width*0.03),
        child: Column(
          children: [
            Text('Questions ($questionNumber/${questions.length})'),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 20.h,
                      color: Colors.red,
                    );
                  },
                  itemBuilder: (context, index) {
                    final _qustion = questions[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40.w,
                              height: 40.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.5,
                                color: Theme.of(context).colorScheme.primary
                              ),
                              borderRadius: BorderRadius.circular(30.sp),
                            ),
                                child: Center(
                                  child: Text(
                              '${index+1}',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary
                              ),
                            ),
                                )),
                            SizedBox(width: 15.w,),
                            Text(
                              _qustion.text,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _qustion.options
                              .map((option) => buildOptions(context, option))
                              .toList(),
                        ),
                      ],
                    );
                  },
                  itemCount: questions.length),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOptions(BuildContext context, Options option) {
    return Column(
      children: [
        Container(height: 8.h, width: MediaQuery.of(context).size.width),
        Container(
            height: 75,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                    child: Text(
                      option.text,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            )),
        Container(height: 8.h, width: MediaQuery.of(context).size.width),
      ],
    );
  }
}
