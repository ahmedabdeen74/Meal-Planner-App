import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/assets.dart';
import 'package:meal_planner/core/utility/styles.dart';

void main() {
  runApp(const MealPlanner());
}

class MealPlanner extends StatelessWidget {
  const MealPlanner({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return  MaterialApp( 
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child:Text(
              'This is Hurricane font!',
              style: Styles.textStyleregular36
              ),
            ),
            const SizedBox(
              height: 16,
            ),
           Image.asset(AssetsData.mealDetails1),
          ],
        ),
        
        ),
    );
  }
}


