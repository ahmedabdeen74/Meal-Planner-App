import 'package:flutter/material.dart';
import 'package:meal_planner/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.prefixIcon,
    this.onChanged,
    this.suffixIcon,
    this.onTap, this.controller,
  });
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      controller: controller,
      //roller,
      //focusNode: widget.focusNode,
      cursorColor: kPrimaryColor,
      //onSubmitted: (data) {},
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 20,
        ),
        filled: true,
        fillColor: Color(0xffEEEFF3),
        suffixIcon: suffixIcon ?? const Icon(Icons.search),
        prefixIcon: prefixIcon,
        hintText: 'Search',
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}
