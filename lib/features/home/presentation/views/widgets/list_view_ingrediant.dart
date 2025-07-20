import 'package:flutter/material.dart';
import 'package:meal_planner/features/home/presentation/views/widgets/ingrediant_item.dart';

class ListViewIngrediant extends StatelessWidget {
  const ListViewIngrediant({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: IngrediantItem(),
          );
        },
        childCount: 10, // Example count
      ),
    );
  }
}
