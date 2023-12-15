import 'package:dio/dio.dart';
import 'package:movie_app/core/utils/app_strings.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = AppStrings.baseUrl;
  final String token = AppStrings.token;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var options = Options(
      headers: {
        'Authorization': 'Bearer $token'
      }, // Include the token in the headers
    );

    var response = await _dio.get('$baseUrl$endPoint', options: options);

    return response.data;
  }
}
