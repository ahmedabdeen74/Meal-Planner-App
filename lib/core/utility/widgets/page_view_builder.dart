import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/assets.dart';
// better than list view.builder in scroll to show item by item.
final meals = [
      {
        "image":AssetsData.home2,
        "title": "Spicy Arrabiata Penne",
        "country": "Italian"
      },
      {
        "image": AssetsData.home1,
        "title": "Chicken Biryani",
        "country": "Indian"
      },
      {
        "image": AssetsData.mealDetails1,
        "title": "Beef Tacos",
        "country": "Mexican"
      },
    ];


class VerticalMealCards extends StatelessWidget {
  const VerticalMealCards({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    meal["image"]!,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal["title"]!,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        meal["country"]!,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
