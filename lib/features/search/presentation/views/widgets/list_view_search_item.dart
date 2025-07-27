import 'package:flutter/material.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/custom_search_item.dart';

class ListViewSearchItem extends StatelessWidget {
  const ListViewSearchItem({super.key, required this.searchIcoon});
  final Image searchIcoon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomSearchItem(searchIcon: searchIcoon),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
