import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meal_planner/core/utility/api_service.dart';
import 'package:meal_planner/core/utility/errors/failures.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal_model.dart';
import 'package:meal_planner/features/search/data/repo/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<Meal>>> fetchMealsByName(String name) async {
    try {
      final data = await apiService.get(endpoint: "search.php?s=$name");
      final meals = MealModel.fromJson(data).meals ?? [];
      // Optionally, limit the number of meals returned to 'count'
      // final limitedMeals = meals.take(count).toList();
      return right(meals);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
