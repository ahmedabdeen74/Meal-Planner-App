import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/styles.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Spicy Arrabiata Penne",
      style: Styles.textStyleMedium18.copyWith(color: Color(0xff1A1B21)),
    );
  }
}
