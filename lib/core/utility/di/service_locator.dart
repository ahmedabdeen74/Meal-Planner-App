import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_planner/core/utility/api_service.dart';
import 'package:meal_planner/features/explore/data/repo/explore_repo_impl.dart';
import 'package:meal_planner/features/home/data/data_sources/local/home_local_data_source.dart';
import 'package:meal_planner/features/home/data/data_sources/remote/home_remote_Data_source.dart';
import 'package:meal_planner/features/home/data/repo/home_repo_impl.dart';
import 'package:meal_planner/features/home/domain/use_case/fetch_meal_details.dart';
import 'package:meal_planner/features/home/domain/use_case/fetch_meals_use_case.dart';
import 'package:meal_planner/features/search/data/repo/search_repo_impl.dart';
import 'package:meal_planner/features/search/presentation/view_models/cubit/search_meals_cubit.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio())); // for diffrent repo
  // clean architecture
  // UseCases
  
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
       // localDataSource: HomeLocalDataSourceImpl(),
      ),
    ),
  );
  getIt.registerSingleton<FetchMealsUseCase>(
    FetchMealsUseCase(homeRepo: getIt<HomeRepoImpl>()),
  );

  getIt.registerSingleton<FetchMealDetailsUseCase>(
    FetchMealDetailsUseCase(homeRepo: getIt<HomeRepoImpl>()),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<ExploreRepoImpl>(
    ExploreRepoImpl(apiService: getIt.get<ApiService>()),
  );
  // getIt.get<ApiService>();
}
