import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';

part 'fetch_meal_details_state.dart';

class FetchMealDetailsCubit extends Cubit<FetchMealDetailsState> {
  FetchMealDetailsCubit() : super(FetchMealDetailsInitial());
}
