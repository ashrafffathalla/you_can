import 'dart:convert';

// import 'package:taosel_user_app/data/model/country_model.dart';
import 'package:dio/dio.dart';

import 'package:you_can/data/local/hiva_helper.dart';
import 'package:you_can/data/remote/dio_helper.dart';

import '../../core/constant/apis.dart';

class SignUpRepositories {
  final DioHelper dioHelper;
  final HiveHelper hiveHelper;
  String? token;
  String textSelect(String str) {
    str = str.replaceAll('email', '');
    str = str.replaceAll('full_name', '');
    str = str.replaceAll('password', '');
    str = str.replaceAll('phone', '');
    str = str.replaceAll('license_id', '');
    str = str.replaceAll('license_image', '');
    str = str.replaceAll('{', '');
    str = str.replaceAll('}', '');
    str = str.replaceAll('[]', '');
    str = str.replaceAll(']', '');
    str = str.replaceAll('[', '');
    str = str.replaceAll(':', '');
    str = str.replaceAll(',', '\n');
    str = str.replaceAll('.', '');
    str = str.replaceAll('country', '');
    str = str.replaceAll('nationality', '');
    return str;
  }

  SignUpRepositories({required this.dioHelper, required this.hiveHelper});

//get Country
//   Future<CountryListModel> getCountry() async {
//     try {
//       final Response response = await dioHelper.getData(
//           url: AutomationApi.countriesUrl, needAuth: false);
//
//       final data = json.decode(response.data) as Map<String, dynamic>;
//       final CountryListModel countryListModel = CountryListModel.fromMap(data);
//
//       return countryListModel;
//     } on DioError catch (dioError) {
//       var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
//
//       throw error['message'];
//     } catch (error) {
//       throw '..Oops $error';
//     }
//   }

//Sign Up
  Future<Response> studentSignUp(
      {
      required String name,
      required String phone,
      required String password,
      required String password_confirmation,
      required String birth_date,
      required String gender,
      }) async {
    try {

      FormData formData = FormData.fromMap({
        "full_name": name,
        "phone": phone,
        "password": password,
        "password_confirmation": password_confirmation,
        "birth_date": birth_date,
        "gender": gender,
      });
      final Response response = await dioHelper.postData(
        needAuth: false,
        url: AutomationApi.registerUrl,
        data: formData,
      );
      print(response.data);
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      dynamic code = data['student']["code"];
      await HiveHelper().putData('studentCode', code);
      // token = data['data']["token"];
      //  await HiveHelper().putData('tokenRegister', token);
      // print(HiveHelper().getData('tokenRegister').toString()+'65656565656');

      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      print(error.toString());
      throw textSelect(error['data'].toString());
    } catch (error) {
      throw '..Oops $error';
    }
  }

//Check Otp
  Future<Response> otp({
    required String otp,
  }) async {
    try {
      final Response response = await dioHelper.postOTPData(
        needAuth: true,
        url: AutomationApi.checkOtpRegisterUrl,
        data: {
          "otp": otp,
        },
      );
      // var data = jsonDecode(response.data) as Map<String, dynamic>;
      // await hiveHelper.putData("token", token);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;

      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
//Check Change pass Otp
  ///SEND CODE AGAIN
  Future<Response> Againotp({
    required String otp,
  }) async {
    try {
      final Response response = await dioHelper.againPostOTPData(
        needAuth: true,
        url: AutomationApi.checkOtpRegisterUrl,
        data: {
          "otp": otp,
        },
      );
      // var data = jsonDecode(response.data) as Map<String, dynamic>;
      // await hiveHelper.putData("token", token);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
  ///
  Future<Response> otpPass({
    required String otp,
  }) async {
    try {
      final Response response = await dioHelper.postData(
        needAuth: true,
        url: AutomationApi.checkOtpRegisterUrl,
        data: {
          "otp": otp,
        },
      );
      // var data = jsonDecode(response.data) as Map<String, dynamic>;
      // await hiveHelper.putData("token", token);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
  //change Phone
  Future<Response> changePhone({
    required String phone,
  }) async {
    try {
      final Response response = await dioHelper.postOTPData(
        needAuth: true,
        url: AutomationApi.changePhoneUrl,
        data: {
          "phone": phone,
        },
      );
      // var data = jsonDecode(response.data) as Map<String, dynamic>;

      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
}
