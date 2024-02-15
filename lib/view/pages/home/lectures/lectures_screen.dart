import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';
import 'package:you_can/view/pages/home/lectures/lessonsScreen/lessons.dart';
import 'package:you_can/view/widgets/list_of_LevelsScreen.dart';

import '../../../../provider/levelsCubit/levelsCubit.dart';
import '../home/home_screen.dart';

class LecturesScreen extends StatelessWidget {
  const LecturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    final cubit = BlocProvider.of<AllLevelsCubit>(context);
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
                  navigateTo(context, LessonsScreen());
                },
                child: SizedBox(
                  height: size.height,
                  child: ListView.separated(
                      physics:NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () async{
                              print(index.toString()+"HH");
                              cubit.getAllLessons(index+1);
                              navigateTo(context, LessonsScreen(
                                levelName: cubit.levelsModel!.data![index].name.toString(),
                              ));
                            },
                            child: listOfLevels(locale,context,cubit.levelsModel!.data![index].name.toString(),cubit.levelsModel!.data![index].isActive));
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.transparent,
                        );
                      },
                      itemCount: 5),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
