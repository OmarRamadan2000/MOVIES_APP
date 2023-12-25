import 'package:dio/dio.dart';
import 'package:movie_app/core/utils/app_strings.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = AppStrings.baseUrl;
  final String apiKey = AppStrings.apiKey;
  int pageNumber = 1;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get(
      {required String endPoint, pageNumber}) async {
    var response = await _dio.get('$baseUrl$endPoint', queryParameters: {
      'language': 'en',
      'page': pageNumber,
      'api_key': apiKey,
    });

    return response.data;
  }
}
