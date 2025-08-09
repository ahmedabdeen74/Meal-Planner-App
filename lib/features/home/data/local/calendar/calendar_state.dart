



import 'package:equatable/equatable.dart';
import 'package:meal_planner/features/calendar/data/models/calendar_meal.dart';

abstract class CalendarState extends Equatable {
  const CalendarState();

  @override
  List<Object> get props => [];
}

class CalendarInitial extends CalendarState {}

class CalendarLoading extends CalendarState {}

class CalendarLoaded extends CalendarState {
  final List<CalendarMeal> meals;

  const CalendarLoaded({required this.meals});

  @override
  List<Object> get props => [meals];
}

class CalendarMealAdded extends CalendarState {
  final List<CalendarMeal> meals;

  const CalendarMealAdded({required this.meals});

  @override
  List<Object> get props => [meals];
}

class CalendarMealRemoved extends CalendarState {
  final List<CalendarMeal> meals;

  const CalendarMealRemoved({required this.meals});

  @override
  List<Object> get props => [meals];
}

class CalendarFailure extends CalendarState {
  final String errorMessage;

  const CalendarFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}