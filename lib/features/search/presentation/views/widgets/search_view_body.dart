import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/core/utility/service_locator.dart';
import 'package:meal_planner/features/search/data/repo/search_repo_impl.dart';
import 'package:meal_planner/features/search/presentation/view_models/cubit/search_meals_cubit.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/first_search_body_view.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/search_view_body_loaded.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  bool isLoading = false;
  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: isLoading
          ? BlocProvider(
            create:(context) => SearchMealsCubit(getIt<SearchRepoImpl>()),
            child: SearchViewBodyLoaded(
                controller: searchController,
                onTapRemove: () {
                  searchController.clear();
                },
                onTapBack: () {
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
          )
          : FirstSearchBodyView(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
              },
            ),
    );
  }
}
