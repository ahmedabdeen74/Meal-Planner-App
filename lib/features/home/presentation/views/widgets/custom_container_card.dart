import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/assets.dart';
import 'package:meal_planner/core/utility/styles.dart';

class CustomContainerCard extends StatelessWidget {
  const CustomContainerCard({super.key, required this.category, required this.image});
   final String category;
   final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .04,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset(image),
          SizedBox(width: 6),
          Text(
            category,
            textAlign: TextAlign.center,
            style: Styles.textStyleregular12,
          ),
        ],
      ),
    );
  }
}
