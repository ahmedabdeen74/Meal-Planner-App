part of 'fetch_meals_cubit.dart';

sealed class FetchMealsState extends Equatable {
  const FetchMealsState();

  @override
  List<Object> get props => [];
}

final class FetchMealsInitial extends FetchMealsState {}

final class FetchMealsLoading extends FetchMealsState {}

final class FetchMealsSuccess extends FetchMealsState {
  final List<Meal> meals;

  const FetchMealsSuccess(this.meals);
}

final class FetchMealsFailure extends FetchMealsState {
  final String errorMessage;

  const FetchMealsFailure(this.errorMessage);
}
