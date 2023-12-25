import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/view/pages/home/layout.dart';
import 'package:you_can/view/widgets/defaultBtn.dart';

import '../../../../../../../shared/shared_commponents/commponents.dart';

class ImageHomeworkScreen extends StatefulWidget {
   ImageHomeworkScreen({super.key});

  @override
  State<ImageHomeworkScreen> createState() => _ImageHomeworkScreenState();
}

class _ImageHomeworkScreenState extends State<ImageHomeworkScreen> {
  final List<Question> questions = [
    Question(
      question: 'What is the capital of France?',
      options: ['Paris', 'London', 'Berlin', 'Rome'],
      correctAnswer: 'Paris',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector( onTap:() {
          Navigator.pop(context);},
            child: Icon(Icons.arrow_back_ios_new)),
        title: Text('Homework'),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: size.width*0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text('Questions (2/3)',style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600
                  ),),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.transparent,
                      border: Border.all(color: Theme.of(context).colorScheme.primary,width: 1.5),
                    ),
                    child: Center(child: Text('3',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),),),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text('What is this called?',style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600
                    ),),
                  ),
                ],
              ),
              SizedBox(height: size.height*0.03,),
              Image.asset('assets/images/homework.png'),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    final question = questions[index];
                    return Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: question.options.map((option) {
                                return Row(
                                  children: [
                                    Radio<String>(
                                      activeColor: Color(0xff4F23FF),
                                      value: option,
                                      groupValue: question.selectedAnswer,
                                      onChanged: (value) {
                                        setState(() {
                                          question.selectedAnswer = value;
                                        });
                                      },
                                    ),
                                    Text(option,style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600
                                    ),),
                                  ],
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ///
              DefaultAppButton(onTap: (){
                navigateTo(context, LayoutScreen());
              }, height: 51.h, width: MediaQuery.of(context).size.width, btnTitle:locale!.done )
            ],
          ),

          ),
        ),
    );
  }
}
class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;
  String? selectedAnswer;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.selectedAnswer,
  });
}