import 'package:flutter/material.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';

import '../../../../widgets/list_of_LevelsScreen.dart';
import '../../lectures/lessonsScreen/inside_screens/lessonVideo/lessonVideo.dart';

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    return  Scaffold(
      appBar: AppBar(
        title: Text(
            "Level Name Here"
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size.width*0.03),
          child: Column(
            children: [
              Row(
                children: [
                  Text(locale!.lessons.toString()),
                  Text('(1/20)')
                ],
              ),
              GestureDetector(
                onTap: () {
                  navigateTo(context, LessonVideoScreen());
                },
                child: SizedBox(
                  height: size.height/1.3,
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return ListLevelsScreen(title: '${index+1}: '+'Lesson Name',image: index ==2 ||index ==1?'assets/images/play.svg':'assets/images/complete.svg',subTitle: 'It takes 32 mins to complete ',);
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: 12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
