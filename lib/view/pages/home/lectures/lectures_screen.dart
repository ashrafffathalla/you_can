import 'package:flutter/material.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';
import 'package:you_can/view/pages/home/lectures/lessonsScreen/lessons.dart';
import 'package:you_can/view/widgets/list_of_LevelsScreen.dart';

class LecturesScreen extends StatelessWidget {
  const LecturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      appBar: AppBar(
        title: Text(
          locale!.levels.toString()
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size.width*0.03),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  navigateTo(context, LessonsScreen(

                  ));
                },
                child: SizedBox(
                  height: size.height/1.3,
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return ListLevelsScreen(title: 'Level Name',image: 'assets/images/arrow.svg',subTitle: '8 Lessons',);
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
