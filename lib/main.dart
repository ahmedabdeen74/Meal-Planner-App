import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_planner/constants.dart';
import 'package:meal_planner/core/utility/app_router.dart';
import 'package:meal_planner/core/utility/di/service_locator.dart';
import 'package:meal_planner/features/calendar/data/models/calendar_meal.dart';
import 'package:meal_planner/features/home/data/local/Favourite/add_meal_cubit.dart';
import 'package:meal_planner/features/home/data/local/calendar/calendar_cubit.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/home/data/repo/home_repo_impl.dart';
import 'package:meal_planner/features/home/presentation/view_models/fetch_meal_details_cubit/fetch_meal_details_cubit.dart';
import 'package:meal_planner/features/home/presentation/view_models/fetch_meals_cubit/fetch_meals_cubit.dart';
import 'package:meal_planner/simple_bloc_observer.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(MealAdapter());
  Hive.registerAdapter(CalendarMealAdapter());
  await Hive.openBox<Meal>(kMealBox);
  await Hive.openBox<CalendarMeal>(kMealBoxCalendar);
  setupServiceLocator(); 
  runApp(const MealPlanner());
}

class MealPlanner extends StatelessWidget {
  const MealPlanner({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchMealsCubit(getIt<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => FetchMealDetailsCubit(getIt<HomeRepoImpl>()),
        ),
        BlocProvider(create: (context) => AddMealCubit()),
       BlocProvider(create: (context) => CalendarCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
