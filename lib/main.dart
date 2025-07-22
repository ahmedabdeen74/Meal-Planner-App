import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/core/utility/app_router.dart';
import 'package:meal_planner/core/utility/service_locator.dart';
import 'package:meal_planner/features/home/data/repo/home_repo_impl.dart';
import 'package:meal_planner/features/home/presentation/view_models/fetch_meal_details_cubit/fetch_meal_details_cubit.dart';
import 'package:meal_planner/features/home/presentation/view_models/fetch_meals_cubit/fetch_meals_cubit.dart';

void main() {
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
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
