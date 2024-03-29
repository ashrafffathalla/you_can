import 'dart:convert';

import 'package:you_can/core/constant/apis.dart';
import 'package:dio/dio.dart';

import 'package:you_can/data/local/hiva_helper.dart';
import 'package:you_can/data/model/LevelsModel.dart';
import 'package:you_can/data/model/addcomments_model.dart';
import 'package:you_can/data/model/lessonsByLevelModel.dart';
import 'package:you_can/data/remote/dio_helper.dart';

import '../../data/model/onlineMeetingModel.dart';

class LevelsRepositories {
  final DioHelper dioHelper;
  final HiveHelper hiveHelper;

  LevelsRepositories({required this.dioHelper, required this.hiveHelper});

  ///------------------------
  ///--------Get All Levels----------
  ///----------------------------
  Future<LevelsModel> allLevelsRepositories() async {
    try {
      final Response response =
          await dioHelper.getData(url: AutomationApi.levels, needAuth: true);
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final LevelsModel levelsModel = LevelsModel.fromJson(data);
      return levelsModel;
    } on DioException catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }

  ///------------------------
  ///--------Get Level Lessons----------
  ///----------------------------
  Future<LessonsByLevelModel> allLessonsInLevelRepositories(id) async {
    try {
      final Response response = await dioHelper.getData(
          url: AutomationApi.lessonsInLevels + '${id}', needAuth: true);
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final LessonsByLevelModel lessonsByLevelModel =
          LessonsByLevelModel.fromJson(data);
      return lessonsByLevelModel;
    } on DioException catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }

  ///------------------------
  ///--------Add And Show Comments----------
  ///----------------------------

  Future<AddCommentsModel> addComments(lesson_id, body) async {
    try {
      final Response response = await dioHelper.postData(
          url: AutomationApi.addComment,
          data:{
            "lesson_id":lesson_id,
            "body":body,
          },
          needAuth: true);
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final AddCommentsModel addCommentsModel =
      AddCommentsModel.fromJson(data);
      return addCommentsModel;
    } on DioException catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }

  ///------------------------
  ///--------Add And Show onlineLesson----------
  ///----------------------------

  Future<OnlineMeeting> getOnlineLesson(id) async {
    try {
      final Response response = await dioHelper.getData(
          url: 'https://youcan-academy.com/public/online-lesson/' + '${id}', needAuth: true);
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final OnlineMeeting onlineMeeting =
      OnlineMeeting.fromJson(data);
      return onlineMeeting;
    } on DioException catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
}
