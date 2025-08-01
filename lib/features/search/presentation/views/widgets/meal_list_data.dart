import 'package:flutter/material.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/list_view_custom_search_result_item.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/list_view_search_result_item.dart'
    show ListViewSearchResultItem;

class MealListData extends StatelessWidget {
  const MealListData({
    super.key,
   
    required this.meals,
  });
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    return //SingleChildScrollView(
      /*  child: Column(
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
        Divider(color: Color(0xff757780), thickness: 1.5, height: 1),*/
      Container(
        decoration: BoxDecoration(
          color: Color(0xffEEEFF3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListViewSearchResultItem(meals: meals),
              SizedBox(height: 16),
              Divider(color: Color(0xffC5C6D0), thickness: 1, height: 1),
              ListViewCustomSearchResultItem(meals: meals),
            ],
          ),
        ),
      
    );
  }
}
