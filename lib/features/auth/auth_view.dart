import 'package:flutter/material.dart';
import 'package:meal_planner/features/auth/presentation/widgets/auth_view_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthViewBody(),
    );
  }
}
