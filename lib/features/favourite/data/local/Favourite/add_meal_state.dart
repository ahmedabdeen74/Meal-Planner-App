part of 'add_meal_cubit.dart';

abstract class AddMealState extends Equatable {
  const AddMealState();

  @override
  List<Object?> get props => [];
}

class AddMealInitial extends AddMealState {}

class AddMealLoading extends AddMealState {}

class MealsLoaded extends AddMealState {
  final List<Meal> meals;
  
  const MealsLoaded({required this.meals});
  
  @override
  List<Object> get props => [meals];
}

class AddMealSuccess extends AddMealState {
  final List<Meal> meals;
  
  const AddMealSuccess({required this.meals});
  
  @override
  List<Object> get props => [meals];
}

class RemoveMealSuccess extends AddMealState {
  final List<Meal> meals;
  
  const RemoveMealSuccess({required this.meals});
  
  @override
  List<Object> get props => [meals];
}

class AddMealFailure extends AddMealState {
  final String errMessage;

  const AddMealFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}