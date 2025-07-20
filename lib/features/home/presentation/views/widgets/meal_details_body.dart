import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/styles.dart';
import 'package:meal_planner/features/home/presentation/views/widgets/list_view_ingrediant.dart';
import 'package:meal_planner/features/home/presentation/views/widgets/meal_details_app_bar.dart';
import 'package:meal_planner/features/home/presentation/views/widgets/meal_details_card.dart';
import 'package:meal_planner/features/home/presentation/views/widgets/video_instraction.dart';

class MealDetailsBody extends StatelessWidget {
  const MealDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: MealDetailsAppBar(),
          ),
          // SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: CustomScrollView(
                slivers: [
                  // SliverToBoxAdapter(child: MealDetailsAppBar()),
                  SliverToBoxAdapter(child: SizedBox(height: 16)),
                  SliverToBoxAdapter(child: MealDetailsCard()),
                  SliverToBoxAdapter(child: SizedBox(height: 8)),
                  ListViewIngrediant(),
                  SliverToBoxAdapter(child: SizedBox(height: 16)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        "Recipe Video",
                        style: Styles.textStyleSemibold21,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 8)),
                  SliverToBoxAdapter(child: VideoInstraction()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
