import 'package:flutter/material.dart';
import 'package:meal_planner/features/favourite/presentation/widgets/favourite_view_body.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FavouriteViewBody(),
      ),
    );
  }
}
