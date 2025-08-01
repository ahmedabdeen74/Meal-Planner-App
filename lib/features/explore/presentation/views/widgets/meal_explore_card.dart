import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/assets.dart';
import 'package:meal_planner/core/utility/styles.dart';

class MealExploreCard extends StatelessWidget {
  const MealExploreCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width * 0.9;
    final double cardHeight = MediaQuery.of(context).size.height * 0.46;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            AssetsData.home1,
            fit: BoxFit.cover,
            width: cardWidth,
            height: cardHeight,
          ),
          /* Image.network(
                       widget.meals[index].strMealThumb ?? AssetsData.home1,
                        fit: BoxFit.cover,
                        width: cardWidth,
                        height: cardHeight,
                      ),*/
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xff7C7C7C).withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Spicy Arrabiata Penne",
                  style: Styles.textStyleSemibold13.copyWith(),
                ),
                const SizedBox(height: 4),
                Text(
                  "Italian",
                  style: Styles.textStyleLight12.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
