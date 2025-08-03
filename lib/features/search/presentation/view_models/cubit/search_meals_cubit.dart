import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/search/data/repo/search_repo.dart';

part 'search_meals_state.dart';

class SearchMealsCubit extends Cubit<SearchMealsState> {
  SearchMealsCubit(this.searchRepo) : super(SearchMealsInitial());
  final SearchRepo searchRepo;
  fetchMealsByName({required String mealName}) async {
    emit(SearchMealsLoading());
    final meals = await searchRepo.fetchMealsByName(mealName);
    meals.fold(
      (failure) => emit(SearchMealsFailure(errMessage: failure.errMessage)),
      (meals) => emit(SearchMealsSuccess(meals: meals)),
    );
  }

  void reset() {
    emit(SearchMealsInitial());
  }
}
