import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/styles.dart';
class IngrediantItem extends StatelessWidget {
  const IngrediantItem({super.key,required this.ingredient, required this.measure});
  final String ingredient;
  final String measure;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Image.network(
            'https://www.themealdb.com/images/ingredients/$ingredient-Small.png',
            width: 50,
            height: 50,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
          ),
          SizedBox(width: 48),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ingredient, style: Styles.textStyleRegular18),
              Text(
                measure,
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
