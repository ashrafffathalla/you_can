import 'package:flutter/material.dart';

class MultipleChoicePage extends StatefulWidget {
  MultipleChoicePage({super.key});
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
      if (option == 'New York') {
        answer = "Incorrect";
      } else if (option == 'Paris') {
        answer = "Correct";
      } else if (option == 'London') {
        answer = "Incorrect";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Choice Question'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'What is the capital of France?\n'
                  'A. New York\n'
                  'B. Paris\n'
                  'C. London\n\n'
                  'Answer: $answer', // Display the answer based on the selected option
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            RadioListTile(
              title: Text('New York'),
              value: 'New York',
              groupValue: selectedOption,
              onChanged: _selectOption,
            ),
            RadioListTile(
              title: Text('Paris'),
              value: 'Paris',
              groupValue: selectedOption,
              onChanged: _selectOption,
            ),
            RadioListTile(
              title: Text('London'),
              value: 'London',
              groupValue: selectedOption,
              onChanged: _selectOption,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedOption != null) {
                  // Do something with the selected option
                  print('Selected option: $selectedOption');
                } else {
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
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
