import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/core/utility/styles.dart';
import 'package:meal_planner/features/search/presentation/view_models/cubit/search_meals_cubit.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/meal_list_data.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/search_meal_loading.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/search_view_app_bar.dart';

/*
class SearchViewBodyLoaded extends StatelessWidget {
  const SearchViewBodyLoaded({
    super.key,
    this.onTapBack,
    this.onTapRemove,
    this.controller,
  });
  final void Function()? onTapBack;
  final void Function()? onTapRemove;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMealsCubit, SearchMealsState>(
      builder: (context, state) {
        if (state is SearchMealsLoading) {
          return SearchMealLoading(
            controller: controller,
            onTapBack: onTapBack,
            onTapRemove: onTapRemove,
          );
        }
        if (state is SearchMealsSuccess) {
          if (state.meals.isEmpty) {
            return MealListEmpty(
              controller: controller,
              onTapBack: onTapBack,
              onTapRemove: onTapRemove,
            );
          }
          return MealListData(
            meals: state.meals,
            controller: controller,
            onTapBack: onTapBack,
            onTapRemove: onTapRemove,
          );
        } else if (state is SearchMealsFailure) {
          return Center(
            child: Text(state.errMessage, style: TextStyle(color: Colors.red)),
          );
        }
        // Always return a widget if none of the above conditions are met
        return SearchMealInit(
          controller: controller,
          onTapBack: onTapBack,
          onTapRemove: onTapRemove,
        );
      },
    );
  }
}
*/
class SearchViewBodyLoaded extends StatefulWidget {
  const SearchViewBodyLoaded({
    super.key,
    this.onTapBack,
    this.onTapRemove,
    required this.controller,
  });
  final void Function()? onTapBack;
  final void Function()? onTapRemove;
  final TextEditingController controller;

  @override
  State<SearchViewBodyLoaded> createState() => _SearchViewBodyLoadedState();
}

class _SearchViewBodyLoadedState extends State<SearchViewBodyLoaded> {
  bool isIconClose = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchViewAppBar(),
          const SizedBox(height: 32),
          CustomTextField(
            onChanged: (data) {
              setState(() {
                isIconClose = data.trim().isNotEmpty;
              });

              if (data.trim().isEmpty) {
                BlocProvider.of<SearchMealsCubit>(context).reset();
              } else {
                BlocProvider.of<SearchMealsCubit>(
                  context,
                ).fetchMealsByName(mealName: data);
              }
            },
            controller: widget.controller,
            suffixIcon: isIconClose
                ? GestureDetector(
                    onTap: () {
                      widget.controller.clear();
                      setState(() {
                        isIconClose = false;
                      });
                      BlocProvider.of<SearchMealsCubit>(context).reset();
                      if (widget.onTapRemove != null) widget.onTapRemove!();
                    },
                    child: Icon(Icons.close),
                  )
                : null,
            prefixIcon: GestureDetector(
              onTap: widget.onTapBack,
              child: Icon(Icons.arrow_back),
            ),
          ),
          const Divider(color: Color(0xff757780), thickness: 1.5, height: 1),
          BlocBuilder<SearchMealsCubit, SearchMealsState>(
            builder: (context, state) {
              if (state is SearchMealsLoading) {
                return SearchMealLoading();
              } else if (state is SearchMealsSuccess) {
                if (state.meals.isEmpty) {
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height * .6,
                    child: Center(child: Text("No meals matched your search.")),
                  );
                }
                return MealListData(meals: state.meals);
              } else if (state is SearchMealsFailure) {
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height * .6,
                  child: Center(child: Text(state.errMessage)),
                );
              }
              return SizedBox(
                height: MediaQuery.sizeOf(context).height * .6,
                child: Center(
                  child: Text(
                    "Search for meal now !",
                    style: Styles.textStyleMedium18,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
