import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:meal_planner/features/calendar/calendar_view.dart';
import 'package:meal_planner/features/explore/explore_view.dart';
import 'package:meal_planner/features/favourite/favourite_view.dart';
import 'package:meal_planner/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:meal_planner/features/search/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeViewBody(),
    SearchView(),
    ExploreView(),
    FavouriteView(),
    CalendarView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: GNav(
          backgroundColor: Colors.white,
          color: Colors.grey[600],
          activeColor: Colors.white,
          tabBackgroundColor: Colors.deepOrange,
          gap: 0,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          selectedIndex: currentIndex,
          onTabChange: (index) {
            setState(() => currentIndex = index);
          },
          tabs: const [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.search, text: 'Search'),
            GButton(icon: Icons.explore, text: 'Explore'),
            GButton(icon: Icons.favorite, text: 'Favourite'),
            GButton(icon: Icons.calendar_month, text: 'Calendar'),
          ],
        ),
      ),
    );
  }
}
