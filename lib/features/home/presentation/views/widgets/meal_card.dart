import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/core/utility/styles.dart';
import 'package:meal_planner/core/utility/widgets/mealdetailsbottomsheet.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/home/presentation/view_models/fetch_meal_details_cubit/fetch_meal_details_cubit.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    super.key,
    required this.height,
    this.bottom = 12,
    this.right = 14,
    this.style1 = Styles.textStyleMedium18,
    required this.style2,
    required this.meal,
    this.showIngredientsCountInsteadOfArea = false,
  });
  final double height;
  final double? bottom;
  final double? right;
  final TextStyle? style1;
  final TextStyle style2;
  final Meal meal;
  final bool showIngredientsCountInsteadOfArea;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              BlocProvider.of<FetchMealDetailsCubit>(
                context,
              ).fetchMealDetails(id: meal.idMeal ?? "");
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const MealDetailsBottomSheet(),
              );
            },

            child: Stack(
              children: [
                Container(
                  height: height, //MediaQuery.sizeOf(context).height * .35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(10, 10),
                        color: Colors.grey.withOpacity(0.4),
                        blurRadius: 40,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(16),
                    child: /*Image.asset(
                      Assets.imagesHome1,
                      fit: BoxFit.cover,*/ Image.network(
                      meal.strMealThumb ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  bottom: bottom,
                  right: right,
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * .04,
                    width: 85,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        meal.strCategory ?? "Category",
                        textAlign: TextAlign.center,
                        style: Styles.textStyleregular12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(meal.strMeal ?? "no name founded", style: style1),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              showIngredientsCountInsteadOfArea
                  ? "${meal.getIngredients().length} Ingredients"
                  : meal.strArea ?? "no area founded",
              style: style2,
            ),
          ),
        ],
      ),
    );
  }
}
