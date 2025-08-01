import 'package:flutter/material.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/search_result_item.dart';

class ListViewSearchResultItem extends StatelessWidget {
  const ListViewSearchResultItem({super.key, required this.meals});
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchResultItem(meal: meals[index]),
        );
      },
      itemCount:meals.length ,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
