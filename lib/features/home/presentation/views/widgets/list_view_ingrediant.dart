import 'package:flutter/material.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/home/presentation/views/widgets/ingrediant_item.dart';

class ListViewIngrediant extends StatelessWidget {
  const ListViewIngrediant({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final ingredient = meal.getIngredients()[index];
        final measure = meal.getMeasures()[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: IngrediantItem(ingredient: ingredient, measure: measure),
        );
      }, childCount: meal.getIngredients().length),
    );
  }
}
