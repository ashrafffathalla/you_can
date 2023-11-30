import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:you_can/language/locale.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Chuks Okwuenu',
      'pic': 'assets/images/person.png',
      'message': 'I love to code',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Chuks Okwuenu',
      'pic': 'assets/images/person.png',
      'message': 'I love to code',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'assets/images/person.png',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Tunde Martins',
      'pic': 'assets/images/person.png',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'assets/images/person.png',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'assets/images/person.png',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size.width*0.0),
          child: Column(
            children: [
             /* Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          CircleAvatar(
                              radius: 30,
                              child: Image.asset('assets/images/person.png')),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'UserName',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    '• 3 mins ago ',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff949494)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Thank you so much for your efforts.',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: 3),
              ),*/
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.38,
                    child: CommentBox(
                      userImage: CommentBox.commentImageParser(
                          imageURLorPath: "assets/images/person.png"),
                      child: commentChild(filedata),
                      labelText: 'Write a comment...',
                      errorText: 'Comment cannot be blank',
                      withBorder: false,
                      sendButtonMethod: () {
                        if (formKey.currentState!.validate()) {

                          setState(() {
                            var value = {
                              'name': 'New User',
                              'pic':
                                  'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                              'message': commentController.text,
                              'date': '2021-01-01 12:00:00'
                            };
                            filedata.insert(0, value);
                          });
                          commentController.clear();
                          FocusScope.of(context).unfocus();
                        } else {
                          print("Not validated");
                        }
                      },
                      formKey: formKey,
                      commentController: commentController,
                      backgroundColor: Colors.white,
                      textColor: Colors.grey,
                      sendWidget: Icon(Icons.send_sharp, size: 30, color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: data[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
              trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }
}
