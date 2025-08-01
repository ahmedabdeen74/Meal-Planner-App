import 'package:flutter/material.dart';
import 'package:meal_planner/features/explore/presentation/views/widgets/explore_view_details_app_bar.dart';
import 'package:meal_planner/features/explore/presentation/views/widgets/list_view_meal_explore_card.dart';

class ExploreViewDetailsBody extends StatelessWidget {
  const ExploreViewDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [ExploreViewDetailsAppBar(), SizedBox(height: 32)],
            ),
            
          ),
          ListViewMealExploreCard(),
        ],
      ),
    );
  }
}
