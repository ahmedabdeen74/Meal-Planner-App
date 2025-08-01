import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_planner/core/utility/app_router.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/custom_text_field.dart';

class ExploreViewBody extends StatefulWidget {
  const ExploreViewBody({super.key});

  @override
  State<ExploreViewBody> createState() => _ExploreViewBodyState();
}

class _ExploreViewBodyState extends State<ExploreViewBody> {
  int selectedIndex = 0; // 0 = Categories, 1 = Cuisines

  final List<String> categories = [
    "Breakfast",
    "Starter",
    "Dessert",
    "Lunch",
    "Side",
    "Vegan",
    "Breakfast",
    "Starter",
    "Dessert",
    "Lunch",
    "Side",
    "Vegan",
  ];

  final List<String> cuisines = [
    "Italian",
    "Mexican",
    "Chinese",
    "Indian",
    "Thai",
    "French",
    "Italian",
    "Mexican",
    "Chinese",
    "Indian",
    "Thai",
    "French",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Tabs (Categories / Cuisines)
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Categories",
                              style: TextStyle(
                                color: selectedIndex == 0
                                    ? Colors.blue
                                    : Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (selectedIndex == 0)
                              Container(
                                height: 2,
                                color: Colors.blue,
                                margin: const EdgeInsets.only(top: 4),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Cuisines",
                              style: TextStyle(
                                color: selectedIndex == 1
                                    ? Colors.blue
                                    : Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (selectedIndex == 1)
                              Container(
                                height: 2,
                                color: Colors.blue,
                                margin: const EdgeInsets.only(top: 4),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                CustomTextField(),
                const SizedBox(height: 32),

                ListView.builder(
                  // will change to custom list view
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  // padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: selectedIndex == 0
                      ? categories.length
                      : cuisines.length,
                  itemBuilder: (context, index) {
                    final item = selectedIndex == 0
                        ? categories[index]
                        : cuisines[index];
                    return GestureDetector(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).push(AppRouter.kExploreViewDetails);
                      },
                      child: ListTile(
                        // will change to custom list tile
                        leading: const CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          child: Text(
                            "A",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(item),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // Content based on selected tab
  }
}
