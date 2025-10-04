import 'package:flutter/material.dart';
import 'package:meal_planner/constants.dart';
import 'package:meal_planner/features/auth/presentation/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboardFromScreen(context);
      },
      child: Scaffold(body: SignInViewBody()),
    );
  }
}
