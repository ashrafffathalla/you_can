import 'package:flutter/material.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/view/widgets/payment_history_widget.dart';

import '../../../widgets/resultsExamWidget.dart';
class ExamResultsScreen extends StatelessWidget {
  const ExamResultsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Exams Results'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Name'),
                Text('Date'),
                Text('Score'),
                Text('Result'),
              ],
            ),
            SizedBox(
              height: size.height,
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return  ResultsExamWidget(Result: 'Pass', Date: '28-9-1999', Name: "Ashraf", Score: '60%');
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  }, itemCount: 5),
            ),
            SizedBox(height: size.height*0.1,),
          ],
        ),
      ),
    );
  }
}
