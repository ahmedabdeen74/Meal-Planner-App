import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/assets.dart';
import 'package:meal_planner/core/utility/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Morning, User",
          style: Styles.textStyleregular36.copyWith(color: Color(0xff58544A)),
        ),
        Image.asset(AssetsData.user),
      ],
    );
  }
}
