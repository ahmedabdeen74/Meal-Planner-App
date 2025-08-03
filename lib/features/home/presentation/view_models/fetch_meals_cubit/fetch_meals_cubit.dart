import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/home/data/repo/home_repo.dart';

part 'fetch_meals_state.dart';

class FetchMealsCubit extends Cubit<FetchMealsState> {
  FetchMealsCubit(this.homeRepo) : super(FetchMealsInitial());
  final HomeRepo homeRepo;
  fetchMeals({required int count}) async {
    emit(FetchMealsLoading());
    final result = await homeRepo.fetchMeals(count: count);
    result.fold(
      (failure) => emit(FetchMealsFailure(failure.errMessage)),
      (meals) => emit(FetchMealsSuccess(meals)),
    );
  }
}
