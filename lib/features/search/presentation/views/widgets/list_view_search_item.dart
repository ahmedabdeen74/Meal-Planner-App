import 'package:flutter/material.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/custom_search_item.dart';

class ListViewSearchItem extends StatelessWidget {
  const ListViewSearchItem({super.key, required this.searchIcon});
  final Image searchIcon;
  static const List<String> mealName = ["Greek", "Chicken", "Beef"];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomSearchItem(
              searchIcon: searchIcon,
              strMeal: mealName[index],
            ),
          );
        },
        itemCount: mealName.length,
      ),
    );
  }
}
