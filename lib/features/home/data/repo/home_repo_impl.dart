import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meal_planner/core/utility/api_service.dart';
import 'package:meal_planner/core/utility/errors/failures.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal_model.dart';
import 'package:meal_planner/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, Meal>> fetchMealDetails(String mealId) async {
    try {
      final data = await apiService.get(endpoint: "lookup.php?i=$mealId");
      final Meal? meal = MealModel.fromJson(data).meals?.first;
      return meal != null
          ? right(meal)
          : left(ServerFailure(errMessage: "Meal not found"));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
        return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Meal>>> fetchMeals({int count = 5}) async {
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

      return right(meals);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
        return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
/*class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Meal>>> getMeals() async {
    try {
      final meals = await remoteDataSource.fetchMeals();
      return Right(meals);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Meal>>> getCachedMeals() async {
    try {
      final meals = await localDataSource.getCachedMeals();
      return Right(meals);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

}*/