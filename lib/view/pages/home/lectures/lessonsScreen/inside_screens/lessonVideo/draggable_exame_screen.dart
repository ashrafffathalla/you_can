import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';
import 'package:you_can/view/widgets/defaultBtn.dart';

import 'imageHomewrkScreen.dart';

class DraggableExamScreen extends StatefulWidget {
  const DraggableExamScreen({super.key});

  @override
  State<DraggableExamScreen> createState() => _DraggableExamScreenState();
}

class _DraggableExamScreenState extends State<DraggableExamScreen> {
  List<String> words = ['Arranging', 'intermittent', 'words', 'in', 'Flutter'];
  List<String> arrangedWords = [];
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector( onTap:() {
          Navigator.pop(context);},
            child: Icon(Icons.arrow_back_ios_new)),
        title: Text('Homework'),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
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
                    child: Center(child: Text('2',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),),),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text('Arrange the following words',style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600
                    ),),
                  ),
                ],
              ),
              SizedBox(height: 50.h,),
              Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 20.sp),
                        child: DragTarget<String>(
                          builder: (BuildContext context, List<String?> candidateData,
                              List<dynamic> rejectedData) {
                            return Padding(
                              padding:  EdgeInsets.symmetric(vertical: 0.h,horizontal: 20.w),
                              child: Container(
                                height: 30.h,
                                child: Stack(
                                  children: [
                                    Positioned (top: 25.h,child: Container(width: MediaQuery.of(context).size.width/1.2,height: 1.3,color: Colors.black,)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: arrangedWords
                                          .map(
                                            (word) => FittedBox(
                                              child: Text(
                                          word,
                                          style: TextStyle(color: Colors.red,fontSize: 16.sp,fontWeight: FontWeight.w600),
                                        ),
                                            ),
                                      ).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          onAccept: (String data) {
                            setState(() {
                              arrangedWords.add(data);
                              words.remove(data);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: words
                      .map(
                        (word) => Draggable<String>(
                      data: word,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          color: Color(0xffB0B0B0).withOpacity(0.2)
                        ),
                        child: Text(
                          word,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      feedback: Material(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.blue.withOpacity(0.7),
                          child: Text(
                            word,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      childWhenDragging: Container(),
                    ),
                  )
                      .toList(),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.2,),
              DefaultAppButton(onTap: (){
                navigateTo(context, ImageHomeworkScreen());
              }, height: 51.h, width: MediaQuery.of(context).size.width, btnTitle:locale!.next )
            ],
          ),
        ),
      ),
    );
  }
}
