import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_planner/core/utility/api_service.dart';
import 'package:meal_planner/features/explore/data/repo/explore_repo_impl.dart';
import 'package:meal_planner/features/home/data/repo/home_repo_impl.dart';
import 'package:meal_planner/features/search/data/repo/search_repo_impl.dart';
import 'package:meal_planner/features/search/presentation/view_models/cubit/search_meals_cubit.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio())); // for diffrent repo

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<ExploreRepoImpl>(
    ExploreRepoImpl(apiService: getIt.get<ApiService>()),
  );
  // getIt.get<ApiService>();
}
