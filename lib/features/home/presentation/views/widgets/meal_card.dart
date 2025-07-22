import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/assets.dart';
import 'package:meal_planner/core/utility/styles.dart';
import 'package:meal_planner/core/utility/widgets/mealdetailsbottomsheet.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    super.key,
    required this.height,
    this.bottom = 12,
    this.right = 14,
    this.style1 = Styles.textStyleMedium18,
    required this.style2,
  });
  final double height;
  final double? bottom;
  final double? right;
  final TextStyle? style1;
  final TextStyle style2;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const MealDetailsBottomSheet(),
              );
            },

            child: Stack(
              children: [
                Container(
                  height: height, //MediaQuery.sizeOf(context).height * .35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(10, 10),
                        color: Colors.grey.withOpacity(0.4),
                        blurRadius: 40,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(16),
                    child: Image.asset(AssetsData.home1, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  bottom: bottom,
                  right: right,
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * .04,
                    //width: 86,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        "Vegetarian",
                        textAlign: TextAlign.center,
                        style: Styles.textStyleregular12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text("Spicy Arrabiata Penne", style: style1),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text("Italian", style: style2),
          ),
        ],
      ),
    );
  }
}
