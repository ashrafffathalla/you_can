import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:you_can/data/model/lessonsByLevelModel.dart';
import 'package:you_can/provider/exams_cubit/exams_cubit.dart';
import 'package:you_can/provider/exams_cubit/exams_states.dart';
import 'package:you_can/shared/shammer_widget.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';
import 'package:you_can/view/pages/home/exams/examCongratolation.dart';
import 'package:you_can/view/widgets/defaultBtn.dart';

import 'language/locale.dart';

class MultipleChoicePage extends StatefulWidget {
  MultipleChoicePage({super.key,required this.right_answer,required this.examName,required this.question,required this.options,required this.questionNumber, this.index});
  String examName;
  String question;
  String right_answer;
  dynamic index;
  String questionNumber;
  List<String> options;
  Answers? answers;

  @override
  _MultipleChoicePageState createState() => _MultipleChoicePageState();
}

class _MultipleChoicePageState extends State<MultipleChoicePage> {
  String? selectedOption;
  String answer = ""; // Variable to store the answer

  void _selectOption(String? option) {
    setState(() {
      selectedOption = option;
      // Update the answer based on the selected option
      if (option == widget.right_answer) {
        answer = "Incorrect";
      } else {
        answer = "Correct";

      }
      print(answer);
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    var cubit = BlocProvider.of<ExamsCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.examName),
      ),
      body: BlocBuilder<ExamsCubit,ExamsState>(
        builder: (context, state) {
          if(state is ExamQuestionLoading || state is ExamQuestionLoading){
            return LoadingShimmerWidget();
          }
          return SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: size.width*0.05,vertical: size.height*0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //'Answer: $answer',
                  Text("Questions (${widget.questionNumber}/${cubit.allExamModel!.data!.length.toString()})",style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: size.height*0.03),
                  Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 35.h,
                        child: Center(
                          child: Text(widget.questionNumber,style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      Text(
                        widget.question,
                             // Display the answer based on the selected option
                        style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: size.height/3,
                    child: ListView.separated(itemBuilder: (context, index) {
                      return RadioListTile(
                        title: Text(cubit.examQuestionsModel!.data!.answers![index]),
                        value: cubit.examQuestionsModel!.data!.answers![index],
                        groupValue: selectedOption,
                        onChanged: _selectOption,
                      );
                    },
                        separatorBuilder: (context, index) {
                          return SizedBox();
                        }, itemCount: cubit.examQuestionsModel!.data!.answers!.length),
                  ),
                  DefaultAppButton(
                      onTap: () async{
                        if (selectedOption != null) {
                          print(selectedOption);
                          print(widget.right_answer.toString());
                          if(widget.right_answer==selectedOption){
                            navigateTo(context, ExamCongratolation());
                          }
                        }else {
                          // Prompt the user to select an option
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Please select an option'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }

                      },
                      height: 45.h,
                      width: size.width,
                      btnTitle: 'Next'),

                ],
              ),
            ),
          );
        },

      ),
    );
  }
}
