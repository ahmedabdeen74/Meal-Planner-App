import 'package:dartz/dartz.dart' show Either;
import 'package:meal_planner/core/utility/errors/failures.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<Meal>>> fetchMealsByName(String name);
  //Future<Either<Failure, Meal>> fetchMealDetails(String mealId);
  // Future<void> saveFavoriteMeal(String mealId);
  // Future<List<String>> fetchFavoriteMeals();
  // Future<void> removeFavoriteMeal(String mealId);
}
