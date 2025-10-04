import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/home/domain/use_case/fetch_meals_use_case.dart';

part 'fetch_meals_state.dart';

class FetchMealsCubit extends Cubit<FetchMealsState> {
  FetchMealsCubit(this.useCase) : super(FetchMealsInitial());
  final FetchMealsUseCase useCase;
  fetchMeals({required int count}) async {
    emit(FetchMealsLoading());
    final result = await useCase.call(count);
    result.fold(
      (failure) => emit(FetchMealsFailure(failure.errMessage)),
      (meals) => emit(FetchMealsSuccess(meals)),
    );
  }
  void fetchMealsFromCache() {
    final localMeals = useCase.homeRepo.fetchMealsFromCache();
    if (localMeals.isNotEmpty) {
      emit(FetchMealsSuccess(localMeals));
    }
  }
  
}
