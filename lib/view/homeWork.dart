import 'package:flutter/material.dart';
import 'package:you_can/language/locale.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  String selectedAnswer = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is your favorite color?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ChoiceContainer(
              choice: 'Red',
              isSelected: selectedAnswer == 'Red',
              onSelect: () {
                setState(() {
                  selectedAnswer = 'Red';
                });
              },
            ),
            ChoiceContainer(
              choice: 'Blue',
              isSelected: selectedAnswer == 'Blue',
              onSelect: () {
                setState(() {
                  selectedAnswer = 'Blue';
                });
              },
            ),
            ChoiceContainer(
              choice: 'Green',
              isSelected: selectedAnswer == 'Green',
              onSelect: () {
                setState(() {
                  selectedAnswer = 'Green';
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Selected Answer: $selectedAnswer',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class ChoiceContainer extends StatelessWidget {
  final String choice;
  final bool isSelected;
  final VoidCallback onSelect;

  const ChoiceContainer({
    required this.choice,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Text(
          choice,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
