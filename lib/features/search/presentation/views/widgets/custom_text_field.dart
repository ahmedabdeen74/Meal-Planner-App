import 'package:flutter/material.dart';
import 'package:meal_planner/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      //controller: cont
      //roller,
      //focusNode: widget.focusNode,
      cursorColor: kPrimaryColor,
      onSubmitted: (data) {},
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 20,
        ),
        filled: true,
        fillColor: Color(0xffEEEFF3),
        suffixIcon: const Icon(Icons.search),
        hintText: 'Search',
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}
