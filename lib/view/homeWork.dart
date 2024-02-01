import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:you_can/language/locale.dart';

import '../data/model/lessonsByLevelModel.dart';
import '../provider/levelsCubit/levelsCubit.dart';

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


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    final cubit = BlocProvider.of<AllLevelsCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             widget.assignments![0].question.toString(),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView.separated(itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex = index;
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

/*
ChoiceContainer(
                  choice:widget.assignments![0].answers![index].answer.toString(),
                  // isSelected: selectedAnswer == widget.assignments![0].answers![index],
                  onSelect: () {
                    setState(() {
                      isSelected=true;
                      selectedAnswer = widget.assignments![0].answers![index].answer.toString();
                      print(isSelected.toString()+"HHH");
                    });
                  },

                );
 */

            Text(
              'Selected Answer: $selectedAnswer',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

