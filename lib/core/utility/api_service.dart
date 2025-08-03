import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = "https://www.themealdb.com/api/json/v1/1/";
  final Dio dio;
  ApiService(this.dio);
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await dio.get('$baseUrl$endpoint');
    return response.data;
  }
}
