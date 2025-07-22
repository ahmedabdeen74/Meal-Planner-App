import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';

part 'fetch_meals_state.dart';

class FetchMealsCubit extends Cubit<FetchMealsState> {
  FetchMealsCubit() : super(FetchMealsInitial());
}
