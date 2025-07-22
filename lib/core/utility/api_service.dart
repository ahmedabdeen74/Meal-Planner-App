import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';

class ApiService {
  final String baseUrl = "https://www.themealdb.com/api/json/v1/1/";
  final Dio dio;
  ApiService(this.dio);
  Future<List<Meal>> fetchMeals({required String endpoint}) async {
    var response = await dio.get('$baseUrl$endpoint');
    return response.data;
  }
}
