import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:you_can/language/locale.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  List<bool> _checkedList = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Color(0xff4F23FF),
                                  value: _checkedList[index],
                                  onChanged: (newValue) {
                                    setState(() {
                                      _checkedList[index] = newValue!;
                                    });
                                  },
                                ),
                                Text('Q ${index+1} :',style: TextStyle(
                                  fontSize: 16.sp,fontWeight: FontWeight.w700
                                ),),
                              ],
                            ),
                            Text('Identify and correct the grammatical error in the following sentence: "Each of the students in the class were given a textbook."',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xff1F1F1F),
                            ),
                            ),
                          ],
                        ),
                        );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: 5),
            )
          ],
        ),
      ),
    );
  }
}
