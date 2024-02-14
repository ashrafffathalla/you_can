import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/provider/levelsCubit/levelsCubit.dart';
import 'package:you_can/provider/levelsCubit/levelsStates.dart';

import '../../../../../../../provider/profile_cubit/profile_cubit.dart';

class CommentsScreen extends StatefulWidget {
   CommentsScreen({super.key, this.comments,this.LessonId});
   List ?comments;
   dynamic LessonId;
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

  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    final cubit = BlocProvider.of<AllLevelsCubit>(context);
    return BlocBuilder<AllLevelsCubit,AllLevelsState>(
      builder: (context, state) {

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
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
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.32,
                            child: CommentBox(
                              userImage: CommentBox.commentImageParser(
                              imageURLorPath: "assets/images/person.png"),
                              child:ListView.separated(
                                itemBuilder: (context, index) {
                                  return  Padding(
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
                                              borderRadius: new BorderRadius.all(Radius.circular(35))),
                                          child: CircleAvatar(
                                              radius: 35,
                                              backgroundImage: CommentBox.commentImageParser(
                                                  imageURLorPath:'assets/images/person.png')),
                                        ),
                                      ),
                                      title: Text(
                                        BlocProvider.of<ProfileCubit>(context).profileListProfileData!.data!.fullName.toString(),
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(cubit.lessonsByLevelModel!.data![0].comments![index].body.toString()),
                                      // trailing: Text(DateFormat('yyyy-MM-dd').format(DateTime.parse(cubit.lessonsByLevelModel!.data![index].comments![index].created_at.toString())), style: TextStyle(fontSize: 10)),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(

                                   color: Colors.transparent,
                                    height: 5.h,
                                  );
                                },
                                itemCount: cubit.lessonsByLevelModel!.data![0].comments!.length,
                              ),
                              labelText: 'Write a comment...',
                              errorText: 'Comment cannot be blank',
                              withBorder: false,
                              sendButtonMethod: () {
                                if (formKey.currentState!.validate()) {
                                  setState(() {
                                    var value = {
                                      BlocProvider.of<AllLevelsCubit>(context).AddComment(widget.LessonId,commentController.text)
                                    };
                                  filedata.insert(0, value);
                                  });
                                  FocusScope.of(context).unfocus();
                                  commentController.clear();
                                  // setState(() {
                                  //   filedata.insert(0, value);
                                  //   BlocProvider.of<AllLevelsCubit>(context).AddComment(widget.LessonId,commentController.text);
                                  //   FocusScope.of(context).unfocus();
                                  //
                                  // });
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
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }


}
