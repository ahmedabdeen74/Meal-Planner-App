import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/assets.dart';
import 'package:meal_planner/core/utility/styles.dart';

class ExploreViewDetailsAppBar extends StatelessWidget {
  final String name;
  final bool isCategory;

  const ExploreViewDetailsAppBar({
    super.key,
    required this.name,
    required this.isCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(AssetsData.backButton),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 98),
          child: Column(
            children: [
              Text(name, style: Styles.textStyleMedium18),
              Text(
                isCategory ? "Category" : "Area",
                style: Styles.textStyleBold14.copyWith(
                  color: const Color(0xff8C8C8C),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
