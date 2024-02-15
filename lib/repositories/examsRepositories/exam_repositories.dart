import 'dart:convert';
import 'package:you_can/core/constant/apis.dart';
import 'package:dio/dio.dart';
import 'package:you_can/data/local/hiva_helper.dart';
import 'package:you_can/data/model/examModel.dart';
import 'package:you_can/data/remote/dio_helper.dart';

import '../../data/model/allExamsModel.dart';
class ExamsRepositories {
  final DioHelper dioHelper;
  final HiveHelper hiveHelper;

  ExamsRepositories({required this.dioHelper, required this.hiveHelper});

  ///------------------------
  ///--------Get All Levels----------
  ///----------------------------
  Future<AllExamModel> allExamsRepositories() async {
    try {
      final Response response =
      await dioHelper.getData(url: AutomationApi.exams, needAuth: true);
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final AllExamModel examsModel = AllExamModel.fromJson(data);
      return examsModel;
    } on DioException catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }

  ///------------------------
  ///--------Get Exam acquisitions by exam id----------
  ///----------------------------
  Future<ExamQuestionsModel> ExamQuestionRepositories(id) async {
    try {
      final Response response = await dioHelper.getData(
          url:'https://youcan-academy.com/public/api/v1/student/api/exam/$id/question', needAuth: true);
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final ExamQuestionsModel examModel =
      ExamQuestionsModel.fromJson(data);
      return examModel;
    } on DioException catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }

  // ///------------------------
  // ///--------Add And Show Comments----------
  // ///----------------------------
  //
  Future<Response> enrollmentNextLevel(levelId) async {
    try {
      final Response response = await dioHelper.postData(
          url: AutomationApi.enrollment,
          data:{
            "levelId":levelId,
          },
          needAuth: true);
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      // final AddCommentsModel addCommentsModel =
      // AddCommentsModel.fromJson(data);
      return response;
    } on DioException catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
}