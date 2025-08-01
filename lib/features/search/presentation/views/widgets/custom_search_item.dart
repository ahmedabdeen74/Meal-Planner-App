import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/styles.dart';

class CustomSearchItem extends StatelessWidget {
  const CustomSearchItem({
    super.key,
    required this.searchIcon,
    required this.strMeal,
  });

  final Image searchIcon;
  final String strMeal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicWidth(
          // يجعل الـ Container يأخذ العرض المناسب تلقائيًا
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffCAC4D0)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize:
                  MainAxisSize.min, // مهم جدًا عشان الـ Row ما تتمددش بالكامل
              children: [
                searchIcon,
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    strMeal,
                    style: Styles.textStyleBold14.copyWith(
                      color: Color(0xff49454F),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
