import 'package:dartz/dartz.dart';
import 'package:meal_planner/core/utility/api_service.dart';
import 'package:meal_planner/core/utility/errors/failures.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal_model.dart';
import 'package:meal_planner/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<Meal>>> fetchMealDetails(String mealId) {
    // TODO: implement fetchMealDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Meal>>> fetchMeals({int count = 5}) async {
  try {
    final futures = List.generate(count, (_) => apiService.get(endpoint: "random.php"));
    final responses = await Future.wait(futures);

    final meals = responses
        .map((data) => MealModel.fromJson(data).meals?.first)
        .whereType<Meal>()
        .toList();

    return right(meals);
  } catch (e) {
    return left(ServerFailure('Failed to fetch meals: $e'));
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