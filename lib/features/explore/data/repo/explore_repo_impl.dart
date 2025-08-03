import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meal_planner/core/utility/api_service.dart';
import 'package:meal_planner/core/utility/errors/failures.dart';
import 'package:meal_planner/features/explore/data/models/area/meal.dart'
    show Meal, AreaMeal;
import 'package:meal_planner/features/explore/data/models/category/meal.dart';
import 'package:meal_planner/features/explore/data/repo/explore_repo.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';

class ExploreRepoImpl extends ExploreRepo {
  final ApiService apiService;

  ExploreRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<AreaMeal>>> fetchArea() async {
    try {
      final result = await apiService.get(endpoint: "list.php?a=list");

      if (result.containsKey('meals')) {
        final List<AreaMeal> areas = (result['meals'] as List)
            .map((e) => AreaMeal.fromJson(e))
            .toList();
        return Right(areas);
      } else {
        return Left(ServerFailure(errMessage: 'No areas found'));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryMeal>>> fetchCategory() async {
    try {
      final result = await apiService.get(endpoint: "list.php?c=list");

      if (result.containsKey('meals')) {
        final List<CategoryMeal> category = (result['meals'] as List)
            .map((e) => CategoryMeal.fromJson(e))
            .toList();
        return Right(category);
      } else {
        return Left(ServerFailure(errMessage: 'No categories found'));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Meal>>> fetchFilterArea({
    required String area,
  }) async {
    try {
      final result = await apiService.get(endpoint: "filter.php?a=$area");

      if (result['meals'] == null) {
        return Left(ServerFailure(errMessage: "No meals found for area $area"));
      }

      final List<Meal> filterMeals = (result['meals'] as List)
          .map((e) => Meal.fromJson(e))
          .toList();

      return Right(filterMeals);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Meal>>> fetchFilterCategory({
    required String category,
  }) async {
    try {
      final result = await apiService.get(endpoint: "filter.php?c=$category");

      if (result['meals'] == null) {
        return Left(
          ServerFailure(errMessage: "No meals found for area $category"),
        );
      }

      final List<Meal> filterMeals = (result['meals'] as List)
          .map((e) => Meal.fromJson(e))
          .toList();

      return Right(filterMeals);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
