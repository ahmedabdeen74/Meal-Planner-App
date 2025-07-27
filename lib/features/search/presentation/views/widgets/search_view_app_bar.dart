import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/styles.dart';

class SearchViewAppBar extends StatelessWidget {
  const SearchViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Search for Meal",
          style: Styles.textStyleSemibold21.copyWith(color: Color(0xff000000)),
        ),
        SizedBox(height: 8),
        Text(
          "Find meals by name, country, ingredient or category.",
          style: Styles.textStyleLight13.copyWith(color: Color(0xff232323)),
        ),
      ],
    );
  }
}
