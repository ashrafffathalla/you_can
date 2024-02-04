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
          url: AutomationApi.profileUrl, needAuth: true);
      final data = jsonDecode(response.data) as Map<String, dynamic>;
      final ProfileModel profileListData = ProfileModel.fromJson(data);
      return profileListData;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;

      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
}
