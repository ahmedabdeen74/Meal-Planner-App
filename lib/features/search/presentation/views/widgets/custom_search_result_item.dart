import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/assets_generator.dart';

class CustomSearchResultItem extends StatelessWidget {
  const CustomSearchResultItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Greek", style: TextStyle(fontSize: 18, color: Colors.black)),
      subtitle: Text(
        "Cuisine",
        style: TextStyle(fontSize: 14, color: Color(0xff44464F)),
      ),
      leading: CircleAvatar(
        backgroundImage: AssetImage(Assets.imagesHome1),
        radius: 24,
      ),
    );
  }
}
