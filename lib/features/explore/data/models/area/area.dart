import 'package:equatable/equatable.dart';

import 'meal.dart';

class Area extends Equatable {
  final List<AreaMeal>? meals;

  const Area({this.meals});

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    meals: (json['meals'] as List<dynamic>?)
        ?.map((e) => AreaMeal.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'meals': meals?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [meals];
}
