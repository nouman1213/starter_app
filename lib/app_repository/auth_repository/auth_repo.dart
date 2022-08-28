import 'package:starter_app/app_model/user_register.dart';
import 'package:starter_app/utils/app_urls.dart';

import '../../data/network/BaseApiServices.dart';
import '../../data/network/NetworkApiService.dart';

class AuthRepo {
  final BaseApiServices _apiServices = NetworkApiService();

  // RegisterApi method
  Future<dynamic> registerUser(dynamic bodyData) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.registerApiEndPoint, bodyData);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // LoginApi method

  Future<dynamic> loginUser(dynamic bodyData) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPint, bodyData);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
