import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_planner/core/utility/app_router.dart';
import 'package:meal_planner/core/utility/styles.dart';
import 'package:meal_planner/core/utility/widgets/mealdetailsbottomsheet.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/home/presentation/view_models/fetch_meal_details_cubit/fetch_meal_details_cubit.dart';

class MealExploreCard extends StatelessWidget {
  const MealExploreCard({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width * 0.9;
    final double cardHeight = MediaQuery.of(context).size.height * 0.46;
    return GestureDetector(
      onTap: () {
        BlocProvider.of<FetchMealDetailsCubit>(
          context,
        ).fetchMealDetails(id: meal.idMeal!);
        showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const MealDetailsBottomSheet(),
              );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              meal.strMealThumb ?? "",
              fit: BoxFit.cover,
              width: cardWidth,
              height: cardHeight,
            ),
            /* Image.network(
                         widget.meals[index].strMealThumb ?? AssetsData.home1,
                          fit: BoxFit.cover,
                          width: cardWidth,
                          height: cardHeight,
                        ),*/
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff7C7C7C).withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.strMeal ?? "",
                    style: Styles.textStyleSemibold13.copyWith(),
                  ),
                  //  const SizedBox(height: 4),
                  /* Text(
                    meal.strArea??"",
                    style: Styles.textStyleLight12.copyWith(color: Colors.white),
                  ),*/
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
