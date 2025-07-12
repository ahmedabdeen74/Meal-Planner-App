import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/styles.dart';
import 'package:meal_planner/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:meal_planner/features/home/presentation/views/widgets/custom_card_swiper.dart';
import 'package:meal_planner/features/home/presentation/views/widgets/custom_sliver_grid_view.dart';
import 'package:meal_planner/features/home/presentation/views/widgets/meal_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CustomAppBar()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Text(
                "Today’s Meal",
                style: Styles.textStyleBold24.copyWith(
                  color: Color(0xff232323),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "Picked for you today",
                style: Styles.textStyleLight16.copyWith(
                  color: Color(0xff232323),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: MealCard(
                height: MediaQuery.sizeOf(context).height * .35,
                style2: Styles.textStyleLight13.copyWith(
                  color: Color(0xff4E4E4E),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Text(
                "Greek",
                style: Styles.textStyleSemibold21.copyWith(
                  color: Color(0xff000000),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "Suggested cuisine",
                style: Styles.textStyleLight13.copyWith(
                  color: Color(0xff232323),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            CustomSliverGridView(),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Text(
                "Daily Selection",
                style: Styles.textStyleSemibold21.copyWith(
                  color: Color(0xff000000),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "Random meals to explore",
                style: Styles.textStyleLight13.copyWith(
                  color: Color(0xff232323),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 8)),
            SliverToBoxAdapter(child: Expanded(child: CustomCardSwiper())),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: Text(
                "Meal to Prepare",
                style: Styles.textStyleBold24.copyWith(
                  color: Color(0xff232323),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "Today from your calendar",
                style: Styles.textStyleLight13.copyWith(
                  color: Color(0xff232323),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: MealCard(
                height: MediaQuery.sizeOf(context).height * .35,
                style2: Styles.textStyleLight13.copyWith(
                  color: Color(0xff4E4E4E),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }
}
