import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:you_can/data/model/addcomments_model.dart';
import 'package:you_can/provider/exams_cubit/exams_states.dart';
import 'package:you_can/provider/levelsCubit/levelsStates.dart';

import '../../data/model/LevelsModel.dart';
import '../../data/model/allExamsModel.dart';
import '../../data/model/lessonsByLevelModel.dart';
import '../../repositories/examsRepositories/exam_repositories.dart';
import '../../repositories/levelsRepositories/levels_repostories.dart';

class ExamsCubit extends Cubit<ExamsState> {
  ExamsCubit({required this.repositories}) : super(GetAllExamsInitial());
  static ExamsCubit get(context) => BlocProvider.of(context);
  final ExamsRepositories repositories;
  /// -------------------------------------------
  ///----------Get All Orders -----------------
  ///-------------------------------------
  AllExamModel? examModel;
  getAllExams() async {
    emit(GetAllExamsLoading());
    try {
      examModel = await repositories.allExamsRepositories();
      emit(GetAllExamsLoaded());
    } catch (e) {
      emit(GetAllExamsError(error: e.toString()));
    }
  }


  ///------------------------
  ///--------Get Level Lessons----------
  ///----------------------------
  //
  // LessonsByLevelModel? lessonsByLevelModel;
  // getAllLessons(int id) async {
  //   emit(GetAllLessonsLoading());
  //   try {
  //     lessonsByLevelModel = await repositories.allLessonsInLevelRepositories(id);
  //     emit(GetAllLessonsLoaded());
  //   } catch (e) {
  //     emit(GetAllLessonsError(error: e.toString()));
  //   }
  // }
  //
  // AddCommentsModel? commentsModel;
  // AddComment(id,body) async {
  //   emit(AddCommentLoading());
  //   try {
  //     commentsModel = await repositories.addComments(id, body);
  //     emit(AddCommentLoaded());
  //   } catch (e) {
  //     emit(AddCommentError(error: e.toString()));
  //   }
  // }
}