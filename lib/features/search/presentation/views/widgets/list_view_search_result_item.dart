import 'package:flutter/material.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/search_result_item.dart';

class ListViewSearchResultItem extends StatelessWidget {
  const ListViewSearchResultItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchResultItem(),
        );
      },
      itemCount: 3,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
