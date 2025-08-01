import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/core/utility/styles.dart';
import 'package:meal_planner/features/search/presentation/view_models/cubit/search_meals_cubit.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/search_view_app_bar.dart';

class MealListEmpty extends StatelessWidget {
  const MealListEmpty({super.key, this.controller, this.onTapBack, this.onTapRemove});
  final TextEditingController? controller;
  final void Function()? onTapBack;
  final void Function()? onTapRemove;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchViewAppBar(),
        SizedBox(height: 32),
        CustomTextField(
          onChanged: (data) {
            BlocProvider.of<SearchMealsCubit>(
              context,
            ).fetchMealsByName(mealName: data);
          },
          controller: controller,
          suffixIcon: GestureDetector(
            onTap: () {
              controller?.clear();
              BlocProvider.of<SearchMealsCubit>(context).reset();
              if (onTapRemove != null) onTapRemove!();
            },
            child: Icon(Icons.close),
          ),
          prefixIcon: GestureDetector(
            onTap: onTapBack,
            child: Icon(Icons.arrow_back),
          ),
        ),
        Divider(color: Color(0xff757780), thickness: 1.5, height: 1),
        SizedBox(height: 150),
        Text(
          "No meals matched your search.",
          style: Styles.textStyleMedium18.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
