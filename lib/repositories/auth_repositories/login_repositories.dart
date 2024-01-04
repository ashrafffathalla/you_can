import 'dart:convert';

import 'package:you_can/core/constant/apis.dart';
import 'package:dio/dio.dart';

import 'package:you_can/data/local/hiva_helper.dart';
import 'package:you_can/data/remote/dio_helper.dart';

class LoginRepositories {
  final DioHelper dioHelper;
  final HiveHelper hiveHelper;

  LoginRepositories({required this.dioHelper, required this.hiveHelper});

  Future<Response> studentLogin(
      {required String phone, required String password, required String code}) async {
    try {
      final Response response = await dioHelper.postData(
        needAuth: false,
        url: AutomationApi.studentLoginUrl,
        data: {
          "phone": phone,
          "password": password,
          "code": code,
        },
      );
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      // String token = data['data']["token"];
      // await hiveHelper.putData("token", token);
      return response;
    } on DioException catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
}
