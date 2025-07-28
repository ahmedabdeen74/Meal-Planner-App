import 'package:flutter/material.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/custom_search_result_item.dart';

class ListViewCustomSearchResultItem extends StatelessWidget {
  const ListViewCustomSearchResultItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CustomSearchResultItem();
      },
      itemCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
