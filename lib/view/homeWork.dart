import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:you_can/core/helpers/helper_fun.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/view/pages/home/lectures/lessonsScreen/inside_screens/lessonVideo/draggable_exame_screen.dart';
import 'package:you_can/view/widgets/defaultBtn.dart';

import '../data/model/lessonsByLevelModel.dart';
import '../provider/levelsCubit/levelsCubit.dart';
import '../shared/shared_commponents/commponents.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({super.key,this.assignments,});
  List< Assignments>? assignments;


  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int? selectedIndex;
  String selectedAnswer = '';
  bool  isSelected = false;
  late FlutterTts flutterTts;
  int ? currentAnswer;
  @override
  initState() {
    super.initState();
    initTts();
  }
  initTts() {
    flutterTts = FlutterTts();
    _setAwaitOptions();
    if (Platform.isAndroid) {
      flutterTts.getDefaultEngine;
      flutterTts.getDefaultVoice;
    }
  }
  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }
  Future speak(String newVoiceText) async {

    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    if (newVoiceText.isNotEmpty) {
      await flutterTts.speak(newVoiceText);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    final cubit = BlocProvider.of<AllLevelsCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Homework"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget.assignments!.isEmpty?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('There are currently no assignments available for this lesson',style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600
            ),),
          ],
        ): SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                   widget.assignments![0].question.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      speak(widget.assignments![0].question.toString());
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.volume_up_outlined,color: Colors.white,),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              SizedBox(
                height: size.height/2,
                child: ListView.separated(itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedIndex = index;
                      currentAnswer = widget.assignments![0].answers![index].correctAnswer;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        widget.assignments![0].answers![index].answer.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: selectedIndex == index ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }, separatorBuilder: (context, index) {
                  return SizedBox();
                }, itemCount: widget.assignments![0].answers!.length),
              ),
              SizedBox(height: 16.h),
              DefaultAppButton(onTap: (){
                if(currentAnswer==1){
                  navigateTo(context, DraggableExamScreen());
                }else{
                  HelperFunctions.showFlashBar(
                      context: context,
                      title: locale.error.toString(),
                      message: "The answer is incorrect, please try again",
                      icon: Icons.warning_amber,
                      color: Color(0xffF6A9A9),
                      titlcolor: Color(0xffD62E2E),
                      iconColor: Color(0xffD62E2E)
                  );
                }

              }, height: 51.h, width: size.width, btnTitle: locale!.next),
            ],
          ),
        ),
      ),
    );
  }
}

