import 'package:equatable/equatable.dart';

import 'meal.dart';

class MealModel extends Equatable {
  final List<Meal>? meals;

  const MealModel({this.meals});

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
    meals: (json['meals'] as List<dynamic>?)
        ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'meals': meals?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [meals];
}
