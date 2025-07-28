import 'package:flutter/material.dart';
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
          ? SearchViewBodyLoaded(
              controller: searchController,
              onTapRemove: () {
                searchController.clear();
              },
              onTapBack: () {
                setState(() {
                  isLoading = false;
                });
              },
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
