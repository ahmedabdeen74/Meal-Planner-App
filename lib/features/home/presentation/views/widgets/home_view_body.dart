import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/core/utility/styles.dart';
import 'package:meal_planner/features/home/presentation/view_models/fetch_meals_cubit/fetch_meals_cubit.dart';
import 'package:meal_planner/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:meal_planner/features/home/presentation/views/widgets/custom_card_swiper.dart';
import 'package:meal_planner/features/home/presentation/views/widgets/custom_sliver_grid_view.dart';
import 'package:meal_planner/features/home/presentation/views/widgets/meal_card.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchMealsCubit>(context).fetchMeals(count: 8);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchMealsCubit, FetchMealsState>(
      builder: (context, state){
        if (state is FetchMealsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FetchMealsFailure) {
          return Center(child: Text("Error: ${state.errorMessage}"));
        } else if (state is FetchMealsSuccess) {
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
                meal: state.meals[8],
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
            CustomSliverGridView(itemCount: state.meals.length, meal: state.meals),
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
            SliverToBoxAdapter(child: Expanded(child: CustomCardSwiper(meals:state.meals,itemCount: state.meals.length))),
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
                meal:state.meals[12],
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
        // Always return a widget if none of the above states match
        return SizedBox.shrink();
      },
    );
  }
}
