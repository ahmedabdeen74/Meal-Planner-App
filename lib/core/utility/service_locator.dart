import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_planner/core/utility/api_service.dart';
import 'package:meal_planner/features/home/data/repo/home_repo_impl.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio())); // for diffrent repo

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(apiService: getIt.get<ApiService>()));
 // getIt.get<ApiService>();
}