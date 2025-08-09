import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_planner/constants.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';

part 'add_meal_state.dart';

class AddMealCubit extends Cubit<AddMealState> {
  List<Meal> _favoriteMeals = [];
  
  AddMealCubit() : super(AddMealInitial()) {
    _loadFavoriteMeals();
  }

  void _loadFavoriteMeals() {
    try {
      var mealsBox = Hive.box<Meal>(kMealBox);
      _favoriteMeals = mealsBox.values.toList();
      emit(MealsLoaded(meals: List.from(_favoriteMeals)));
    } catch (e) {
      print("❌ Error loading favorite meals: $e");
      emit(AddMealFailure(errMessage: "Error loading meals: ${e.toString()}"));
    }
  }

  // fetch favourite meals
  List<Meal> get favoriteMeals => List.from(_favoriteMeals);

  // check is meal in favourite 
  bool isMealInFavorites(Meal meal) {
    return _favoriteMeals.any((m) => m.idMeal == meal.idMeal);
  }

  // switch favourite state
  Future<void> toggleFavorite(Meal meal) async {
    try {
      emit(AddMealLoading());
      
      final mealsBox = Hive.box<Meal>(kMealBox);
      
      if (isMealInFavorites(meal)) {
        // delete from favourite
        await _removeMealFromFavorites(meal, mealsBox);
      } else {
        // add to favourite
        await _addMealToFavorites(meal, mealsBox);
      }
    } catch (e, stackTrace) {
      print('Error toggling favorite: $e\n$stackTrace');
      emit(AddMealFailure(errMessage: e.toString()));
    }
  }

  // add meal to favourite
  Future<void> _addMealToFavorites(Meal meal, Box<Meal> mealsBox) async {
    await mealsBox.add(meal);
    _favoriteMeals.add(meal);
    emit(AddMealSuccess(meals: List.from(_favoriteMeals)));
  }

  // remove meal from favourites
  Future<void> _removeMealFromFavorites(Meal meal, Box<Meal> mealsBox) async {
    // search about right key
    final keys = mealsBox.keys.where((key) {
      final mealInBox = mealsBox.get(key);
      return mealInBox?.idMeal == meal.idMeal;
    }).toList();
    
    // delete all dublicated key
    for (final key in keys) {
      await mealsBox.delete(key);
    }
    
    // update local list after remove 
    _favoriteMeals.removeWhere((m) => m.idMeal == meal.idMeal);
    emit(RemoveMealSuccess(meals: List.from(_favoriteMeals)));
  }

  // delete meal
  Future<void> deleteMeal(Meal meal) async {
    try {
      emit(AddMealLoading());
      
      var mealsBox = Hive.box<Meal>(kMealBox);
      await _removeMealFromFavorites(meal, mealsBox);
    } catch (e) {
      emit(AddMealFailure(errMessage: "Error deleting meal: ${e.toString()}"));
    }
  }

  
  void refreshFavorites() {
    _loadFavoriteMeals();
  }

  void resetState() {
    emit(AddMealInitial());
  }
}