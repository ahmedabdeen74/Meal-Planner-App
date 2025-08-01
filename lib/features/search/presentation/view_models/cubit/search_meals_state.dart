part of 'search_meals_cubit.dart';

sealed class SearchMealsState extends Equatable {
  const SearchMealsState();

  @override
  List<Object> get props => [];
}

final class SearchMealsInitial extends SearchMealsState {}

final class SearchMealsLoading extends SearchMealsState {}

final class SearchMealsSuccess extends SearchMealsState {
  final List<Meal> meals;

  const SearchMealsSuccess({required this.meals});
}

final class SearchMealsFailure extends SearchMealsState {
  final String errMessage;

  const SearchMealsFailure({required this.errMessage});
}
