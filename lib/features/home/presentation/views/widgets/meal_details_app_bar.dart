import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/assets.dart';
import 'package:meal_planner/core/utility/styles.dart';

class MealDetailsAppBar extends StatelessWidget {
  const MealDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(AssetsData.backButton),
        ),
        Text("Meal to Prepare", style: Styles.textStyleMedium18),
        PopupMenuButton<int>(
          icon: Image.asset(AssetsData.dot3),
          offset: Offset(0, 45),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today, size: 24, weight: 24),
                        SizedBox(width: 12),
                        Text(
                          "Add To Calendar",
                          style: Styles.textStyleRegular18,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.favorite_outline, size: 24, weight: 24),
                        SizedBox(width: 12),
                        Text(
                          "Add to Favorites",
                          style: Styles.textStyleRegular18,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.share, size: 24, weight: 24),
                        SizedBox(width: 12),
                        Text("Share", style: Styles.textStyleRegular18),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
