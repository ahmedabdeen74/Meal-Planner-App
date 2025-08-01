import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/assets.dart';
import 'package:meal_planner/core/utility/styles.dart';

class ExploreViewDetailsAppBar extends StatelessWidget {
  const ExploreViewDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      //   mainAxisAlignment: MainAxisAlignment.,
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
            //   mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Breakfast", style: Styles.textStyleMedium18),
              Text(
                "Category",
                style: Styles.textStyleBold14.copyWith(
                  color: Color(0xff8C8C8C),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
