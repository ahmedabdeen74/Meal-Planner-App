import 'package:equatable/equatable.dart';

import 'meal.dart';

class Category extends Equatable {
  final List<CategoryMeal>? meals;

  const Category({this.meals});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    meals: (json['meals'] as List<dynamic>?)
        ?.map((e) => CategoryMeal.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'meals': meals?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [meals];
}
