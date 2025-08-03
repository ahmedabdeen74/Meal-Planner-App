import 'package:equatable/equatable.dart';

class CategoryMeal extends Equatable {
  final String? strCategory;

  const CategoryMeal({this.strCategory});

  factory CategoryMeal.fromJson(Map<String, dynamic> json) =>
      CategoryMeal(strCategory: json['strCategory'] as String?);

  Map<String, dynamic> toJson() => {'strCategory': strCategory};

  @override
  List<Object?> get props => [strCategory];
}
