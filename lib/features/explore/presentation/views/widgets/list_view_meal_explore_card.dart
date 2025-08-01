import 'package:flutter/material.dart';
import 'package:meal_planner/features/explore/presentation/views/widgets/meal_explore_card.dart';

class ListViewMealExploreCard extends StatelessWidget {
  const ListViewMealExploreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: const MealExploreCard(),
        ),
        childCount: 8,
      ),
    );
  }
}
