import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/constants.dart';
import 'package:meal_planner/core/utility/service_locator.dart';
import 'package:meal_planner/features/search/data/repo/search_repo_impl.dart';
import 'package:meal_planner/features/search/presentation/view_models/cubit/search_meals_cubit.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboardFromScreen(context);
      },
      child: SafeArea(child: Scaffold(body: SearchViewBody())),
    );
  }
}
