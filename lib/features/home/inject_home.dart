import 'package:get_it/get_it.dart';
import 'package:meal_planner/core/network/api_service.dart';
import 'package:meal_planner/features/home/data/data_sources/local/home_local_data_source.dart';
import 'package:meal_planner/features/home/data/data_sources/remote/home_remote_Data_source.dart';
import 'package:meal_planner/features/home/data/repo/home_repo_impl.dart';
import 'package:meal_planner/features/home/domain/use_case/fetch_meal_details.dart';
import 'package:meal_planner/features/home/domain/use_case/fetch_meals_use_case.dart';
import 'package:meal_planner/features/home/presentation/view_models/fetch_meal_details_cubit/fetch_meal_details_cubit.dart';
import 'package:meal_planner/features/home/presentation/view_models/fetch_meals_cubit/fetch_meals_cubit.dart';

final getIt = GetIt.instance;

void injectHome() {
  // ✅ DataSources
  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  // ✅ Repository
  getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(
      homeLocalDataSource: getIt<HomeLocalDataSource>(),
      homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
    ),
  );

  // ✅ UseCases
  getIt.registerLazySingleton<FetchMealsUseCase>(
    () => FetchMealsUseCase(homeRepo: getIt<HomeRepoImpl>()),
  );
  getIt.registerLazySingleton<FetchMealDetailsUseCase>(
    () => FetchMealDetailsUseCase(homeRepo: getIt<HomeRepoImpl>()),
  );

  // ✅ Cubits
  getIt.registerFactory(() => FetchMealsCubit(getIt<FetchMealsUseCase>()));
  getIt.registerFactory(
    () => FetchMealDetailsCubit(getIt<FetchMealDetailsUseCase>()),
  );
}

/*
final getIt = GetIt.instance;
void injectHome() {
  // Data Sources
  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );

  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiService: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      homeLocalDataSource: getIt(),
      homeRemoteDataSource: getIt(),
    ),
  );
  /* getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(
      homeLocalDataSource: getIt(),
      homeRemoteDataSource: getIt(),
    ),
  );*/

  // UseCases
  getIt.registerLazySingleton<FetchMealsUseCase>(
    () => FetchMealsUseCase(homeRepo: getIt()),
  );

  getIt.registerLazySingleton<FetchMealDetailsUseCase>(
    () => FetchMealDetailsUseCase(homeRepo: getIt()),
  );

  // Cubits
  getIt.registerFactory<FetchMealsCubit>(() => FetchMealsCubit(getIt()));

  getIt.registerFactory<FetchMealDetailsCubit>(
    () => FetchMealDetailsCubit(getIt()),
  );
}
*/
