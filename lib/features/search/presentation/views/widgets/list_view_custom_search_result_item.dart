import 'package:flutter/material.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/custom_search_result_item.dart';

class ListViewCustomSearchResultItem extends StatelessWidget {
  const ListViewCustomSearchResultItem({super.key, required this.meals});
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CustomSearchResultItem(meal: meals[index]);
      },
      itemCount: meals.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
