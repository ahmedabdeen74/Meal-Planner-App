import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_planner/constants.dart';
import 'package:meal_planner/core/utility/api_service.dart';
import 'package:meal_planner/core/utility/errors/failures.dart';
import 'package:meal_planner/core/utility/helper/function.dart';
import 'package:meal_planner/features/home/data/data_sources/local/home_local_data_source.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal_model.dart';

abstract class HomeRemoteDataSource {
  Future fetchMealDetails(String id);
  Future fetchMeals({required int count});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;
  //  final HomeLocalDataSource localDataSource;

  HomeRemoteDataSourceImpl({
    required this.apiService,
  }); // required this.localDataSource});

  @override
  Future<Either<Failure, Meal>> fetchMealDetails(String mealId) async {
    try {
      final data = await apiService.get(endpoint: "lookup.php?i=$mealId");
      final Meal meal = MealModel.fromJson(data).meals!.first;
      //await localDataSource.saveMeal(meal); // حفظ في الكاش
      return right(meal);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Meal>>> fetchMeals({required int count}) async {
    try {
      final futures = List.generate(
        count,
        (_) => apiService.get(endpoint: "random.php"),
      );
      final responses = await Future.wait(futures);

      final meals = responses
          .map((data) => MealModel.fromJson(data).meals?.first)
          .whereType<Meal>()
          .toList();

    //  await localDataSource.saveMeals(meals);
      return right(meals);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}

/*
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<Either<Failure, Meal>> fetchMealDetails( String mealId) async {
    try {
      final data = await apiService.get(endpoint: "lookup.php?i=$mealId");
      final Meal meal = MealModel.fromJson(data).meals!.first;
      //saveMealDetails(meal);
      return right(meal);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  

  @override
  Future<Either<Failure, List<Meal>>> fetchMeals({required int count}) async {
    try {
      final futures = List.generate(
        count,
        (_) => apiService.get(endpoint: "random.php"),
      );
      final responses = await Future.wait(futures);

      final meals = responses
          .map((data) => MealModel.fromJson(data).meals?.first)
          .whereType<Meal>()
          .toList();
      saveMeals(meals);
      return right(meals);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

 
}
*/
