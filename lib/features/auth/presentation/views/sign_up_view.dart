import 'package:flutter/material.dart';
import 'package:meal_planner/constants.dart';
import 'package:meal_planner/features/auth/presentation/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboardFromScreen(context);
      },
      child: Scaffold(body: SignUpViewBody()),
    );
  }
}
