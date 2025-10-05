import 'dart:io';

import 'package:dio/dio.dart';
/*
class ApiService {
  final String baseUrl = "https://www.themealdb.com/api/json/v1/1/";
  final Dio dio;
  ApiService(this.dio);
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await dio.get('$baseUrl$endpoint');
    return response.data;
  }
}
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:meal_planner/core/utility/extensions/string_extension.dart'; // لو عندك دالة capitalize()
*/
enum RequestType { get, post, put, delete }

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> requestAPI({
    required String url,
    dynamic body,
    Map<String, String>? headers,
    RequestType type = RequestType.get,
  }) async {
    headers ??= {};

    try {
      final response = await _dio.request(
        url,
        data: body,
        options: Options(
          method: type.name.capitalize(),
          headers: headers,
        ),
      );

      if ([200, 201, 204, 206].contains(response.statusCode)) {
        return response.data;
      } else {
        final data = response.data;
        throw Exception(data['message'] ?? 'Error from server');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Please check internet connection');
      } else if (e.type == DioExceptionType.unknown &&
          e.error is SocketException) {
        throw Exception('Please check internet connection');
      } else if (e.response != null) {
        final data = e.response?.data;
        final message = data['error']?['message'] ?? 'An error occurred';
        throw Exception(message);
      } else {
        rethrow;
      }
    }
  }
}

extension on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
}

