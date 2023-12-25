import 'package:flutter/material.dart';
import 'package:you_can/view/widgets/examWidgetShape.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Exams"),

      ),
      body: Column(
        children: [
          ExamWidgetShape(),
        ],
      ),
    );
  }
}
