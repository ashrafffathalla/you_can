import 'package:flutter/material.dart';

//
// class PracticeScreen extends StatelessWidget {
//   const PracticeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

class PracticeScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<PracticeScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(message: _messages[index]);
              },
            ),
          ),
          SendMessageField(
            textEditingController: _textEditingController,
            onSendMessage: (message) {
              setState(() {
                _messages.add(message);
              });
              _textEditingController.clear();
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.075,)
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}

class MessageBubble extends StatelessWidget {
  final String message;

  MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFD4E6F9),
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: EdgeInsets.all(12.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class SendMessageField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String) onSendMessage;

  SendMessageField({required this.textEditingController, required this.onSendMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), // Add a border for decoration
                borderRadius: BorderRadius.circular(8.0), // Optional: Add border radius
              ),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Optional: Adjust content padding
                  border: InputBorder.none, // Remove border
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          GestureDetector(
            onTap: () {
              String message = textEditingController.text.trim();
              if (message.isNotEmpty) {
                onSendMessage(message);
              }
            },
            child: Icon(Icons.send,color: Theme.of(context).colorScheme.primary,),
          ),
        ],
      ),
    );
  }
}