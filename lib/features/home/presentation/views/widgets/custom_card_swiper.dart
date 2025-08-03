import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/core/utility/assets.dart';
import 'package:meal_planner/core/utility/styles.dart';
import 'package:meal_planner/core/utility/widgets/mealdetailsbottomsheet.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/home/presentation/view_models/fetch_meal_details_cubit/fetch_meal_details_cubit.dart';

class CustomCardSwiper extends StatefulWidget {
  const CustomCardSwiper({super.key, required this.meals, this.itemCount});
  final List<Meal> meals;
  final int? itemCount;
  @override
  State<CustomCardSwiper> createState() => _CardSwiperExampleState();
}

class _CardSwiperExampleState extends State<CustomCardSwiper> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width * 0.8;
    final double cardHeight = MediaQuery.of(context).size.height * 0.48;

    return Center(
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<FetchMealDetailsCubit>(
            context,
          ).fetchMealDetails(id: widget.meals[currentIndex].idMeal!);
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => const MealDetailsBottomSheet(),
          );
          //  GoRouter.of(context).push(AppRouter.kMealDetails);
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Swiper(
              itemCount: widget.meals.length,
              layout: SwiperLayout.STACK,
              itemWidth: cardWidth,
              itemHeight: cardHeight,
              onIndexChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.meals[index].strMealThumb ?? AssetsData.home1,
                        fit: BoxFit.cover,
                        width: cardWidth,
                        height: cardHeight,
                      ),
                    ),
                    if (index == currentIndex)
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
                                widget.meals[index].strMeal ?? "Unknown Meal",
                                style: Styles.textStyleSemibold13.copyWith(),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.meals[index].strArea ?? "Area",
                                style: Styles.textStyleLight12.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
