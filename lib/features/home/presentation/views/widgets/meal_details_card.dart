import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/assets.dart';
import 'package:meal_planner/core/utility/styles.dart';
import 'package:meal_planner/features/home/presentation/views/widgets/custom_container_card.dart';

class MealDetailsCard extends StatelessWidget {
  const MealDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Spicy Arrabiata Penne",
          style: Styles.textStyleBold24.copyWith(color: Color(0xff232323)),
        ),
        Text(
          "From your calendar",
          style: Styles.textStyleLight16.copyWith(color: Color(0xff232323)),
        ),
        SizedBox(height: 16),
        Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * .35,
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
              bottom: 10,
              right: 18,
              child: Row(
                children: [
                  CustomContainerCard(
                    category: "Japanese",
                    image: AssetsData.mealDetails2,
                  ),
                  SizedBox(width: 12),
                  CustomContainerCard(
                    category: "Chicken",
                    image: AssetsData.mealDetails1,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          "Ingredients",
          style: Styles.textStyleSemibold21.copyWith(color: Color(0xff000000)),
        ),
      ],
    );
  }
}
