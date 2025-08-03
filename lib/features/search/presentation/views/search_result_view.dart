import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/constants.dart';
import 'package:meal_planner/core/utility/service_locator.dart';
import 'package:meal_planner/features/search/data/repo/search_repo_impl.dart';
import 'package:meal_planner/features/search/presentation/view_models/cubit/search_meals_cubit.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/search_result_view_body.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({
    super.key,
    this.onChanged,
    this.onTap,
    required this.mealName,
  });

  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? mealName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchMealsCubit(getIt<SearchRepoImpl>()),
      child: GestureDetector(
        onTap: () => hideKeyboardFromScreen(context),
        child: SafeArea(
          child: Scaffold(body: SearchResultViewBody(mealName: mealName ?? "")),
        ),
      ),
    );
  }
}
