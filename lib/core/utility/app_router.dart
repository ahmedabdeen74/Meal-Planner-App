import 'package:go_router/go_router.dart';
import 'package:meal_planner/features/home/presentation/views/home_view.dart';
import 'package:meal_planner/features/home/presentation/views/meal_details_view.dart';
import 'package:meal_planner/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const kAuthView = "/auth_view";
  static const kLoginView = "/login_view";
  static const kSignupView = "/signup_view";
  static const kHomeView = "/home_view";
  static const kSearchView = "/search_view";
  static const kMealDetails = "/meal_view";
  static const kFavouriteView = "/fav_view";
  static const kCalendarView = "/calendar_view";
  static const kExploreView = "/explore_view";
  static const kSettingsView = "/settings_view";

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
     /* GoRoute(
        path: kMealDetails,
        builder: (context, state) => const MealDetailsView(),
      ),*/
    ],
  );
}

/*
    GoRoute(
      path: kAuthView,
      builder: (context, state) => const AuthView(),
    ),
    GoRoute(
      path: kSignupView,
      builder: (context, state) => const SignupView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kMealDetails,
      builder: (context, state) => const MealDetailsView(),
    ),
    GoRoute(
      path: kCalendarView,
      builder: (context, state) => const CalendarView(),
    ),
    GoRoute(
      path: kFavouriteView,
      builder: (context, state) => const FavouriteView(),
    ),
    GoRoute(
      path: kExploreView,
      builder: (context, state) => const ExploreView(),
    ),
    GoRoute(
      path: kSettingsView,
      builder: (context, state) => const SettingsView(),
    ),
  ]);
}
*/
