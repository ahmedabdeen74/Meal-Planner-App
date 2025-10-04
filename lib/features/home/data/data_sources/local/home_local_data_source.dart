import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_planner/constants.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
abstract class HomeLocalDataSource {
  List<Meal> fetchMeals();
  Meal? fetchMealDetails(String mealId);
  Future<void> saveMeals(List<Meal> meals);
  Future<void> saveMeal(Meal meal);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<Meal> fetchMeals() {
    var box = Hive.box<Meal>(kCacheMeal);
    return box.values.toList();
  }

  @override
  Meal? fetchMealDetails(String mealId) {
    var box = Hive.box<Meal>(kCacheMealDetails);
    return box.get(mealId); // Store mealId as the key
  }

  @override
  Future<void> saveMeals(List<Meal> meals) async {
    var box = Hive.box<Meal>(kCacheMeal);
    for (var meal in meals) {
      await box.put(meal.idMeal, meal);
    }
  }

  @override
  Future<void> saveMeal(Meal meal) async {
    var box = Hive.box<Meal>(kCacheMealDetails);
    await box.put(meal.idMeal, meal);
  }
}

/*
abstract class HomeLocalDataSource {
//  fetchMealDetails();
  fetchMeals();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
 /* @override
  Meal? fetchMealDetails() {
    var box = Hive.box<Meal>(kCacheMealDetails);
    if (box.isNotEmpty) {
      return box.values.first;
    }
    return null;
  }
*/
  @override
  fetchMeals() {
    var box = Hive.box<Meal>(kCacheMeal);
    return box.values.toList();
    // Implementation for fetching meals from local storage
  }
  
}
*/
