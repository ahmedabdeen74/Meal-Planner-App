import 'package:equatable/equatable.dart';

class AreaMeal extends Equatable {
  final String? strArea;

  const AreaMeal({this.strArea});

  factory AreaMeal.fromJson(Map<String, dynamic> json) =>
      AreaMeal(strArea: json['strArea'] as String?);

  Map<String, dynamic> toJson() => {'strArea': strArea};

  @override
  List<Object?> get props => [strArea];
}
