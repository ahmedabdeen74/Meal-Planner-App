import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/styles.dart';

class CustomContainerAuth extends StatelessWidget {
  const CustomContainerAuth({
    super.key,
    this.onTap,
    required this.text,
    this.isLoading = false,
  });

  final void Function()? onTap;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: 45,
        width: 285,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                  text,
                  style: Styles.textStyleMedium13.copyWith(
                    color: Colors.white,
                    fontFamily: 'noto_sans',
                  ),
                ),
        ),
      ),
    );
  }
}