import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meal_planner/core/network/api_service.dart';
import 'package:meal_planner/core/network/app_endpoints.dart';
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
      final data = await apiService.requestAPI(
        url: AppEndpoints.searchMeal(name),
        type: RequestType.get,
        headers: {},
      );

      final meals = MealModel.fromJson(data).meals ?? [];
      return right(meals);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
