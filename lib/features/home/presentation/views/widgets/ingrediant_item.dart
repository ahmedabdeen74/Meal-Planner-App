import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/assets.dart';
import 'package:meal_planner/core/utility/styles.dart';

class IngrediantItem extends StatelessWidget {
  const IngrediantItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Image.asset(AssetsData.mealDetails2),
          SizedBox(width: 48),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("penne rigate", style: Styles.textStyleRegular18),
              Text(
                "1 pound",
                style: Styles.textStyleLight14.copyWith(
                  color: Color(0xff44464F),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
