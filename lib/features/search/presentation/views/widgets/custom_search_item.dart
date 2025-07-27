import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/styles.dart';

class CustomSearchItem extends StatelessWidget {
  const CustomSearchItem({super.key, required this.searchIcon});
  final Image searchIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: MediaQuery.sizeOf(context).height * .01,
          width: MediaQuery.sizeOf(context).width * .35,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffCAC4D0)),
            //color: Color(0xffEEEFF3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              searchIcon,
              SizedBox(width: 4),
              Text(
                "Chicken",
                style: Styles.textStyleBold14.copyWith(
                  color: Color(0xff49454F),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
