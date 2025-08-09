import 'package:flutter/material.dart';
import 'package:meal_planner/features/explore/presentation/views/widgets/meal_explore_card.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';

class ListViewMealExploreCard extends StatelessWidget {
  const ListViewMealExploreCard({super.key, required this.meals, this.iconButtonBuilder});
  final List<Meal> meals;
  final Widget Function(BuildContext context, int index)? iconButtonBuilder;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child:  MealExploreCard(meal:meals[index],iconButton: iconButtonBuilder?.call(context, index),)
        ),
        childCount: meals.length,
      ),
    );
  }
}
