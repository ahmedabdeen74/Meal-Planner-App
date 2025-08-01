import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/styles.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/custom_search_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListViewLastSearchItem extends StatefulWidget {
  const ListViewLastSearchItem({super.key, required this.searchIcon});
  final Image searchIcon;

  @override
  State<ListViewLastSearchItem> createState() => _ListViewLastSearchItemState();
}

class _ListViewLastSearchItemState extends State<ListViewLastSearchItem> {
  List<String> mealNames = [];

  @override
  void initState() {
    super.initState();
    loadMealHistory();
  }

  Future<void> loadMealHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> meals = prefs.getStringList('recentSearch') ?? [];
    setState(() {
      mealNames = meals;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (mealNames.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'No recent search.',
          style: Styles.textStyleLight13.copyWith(color: Colors.grey),
        ),
      );
    }

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mealNames.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomSearchItem(
              searchIcon: widget.searchIcon,
              strMeal: mealNames[index],
            ),
          );
        },
      ),
    );
  }
}
