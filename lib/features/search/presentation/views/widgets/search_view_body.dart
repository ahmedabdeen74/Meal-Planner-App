import 'package:flutter/material.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/first_search_body_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: FirstSearchBodyView(),
    );
  }
}
