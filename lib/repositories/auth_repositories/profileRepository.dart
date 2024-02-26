import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:you_can/data/model/profileModel.dart';

import '../../core/constant/apis.dart';
import '../../data/remote/dio_helper.dart';

class GetProfileRepository {
  final DioHelper dioHelper;
  GetProfileRepository({required this.dioHelper});

  Future<ProfileModel> getProfileData() async {
    try {
      final Response response = await dioHelper.getData(
          url: 'https://youcan-academy.com/public/api/v1/student/auth/profile',
          needAuth: true);
      final data = jsonDecode(response.data) as Map<String, dynamic>;
      final ProfileModel profileListData = ProfileModel.fromJson(data);
      return profileListData;
    } on DioException catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;

      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }

  Future<Response> updateAllFields({
    required dynamic name,
    required dynamic password,

  }) async {
    try {
      final Response response = await dioHelper.postData(
          url: AutomationApi.updateAllProfileUrl,
          data: {
            "full_name": name,
            "password": password,
          },
          needAuth: true);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error.toString();
    } catch (error) {
      throw '..Oops $error';
    }
  }
}
