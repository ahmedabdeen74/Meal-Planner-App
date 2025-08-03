import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/home/data/repo/home_repo.dart';

part 'fetch_meal_details_state.dart';

class FetchMealDetailsCubit extends Cubit<FetchMealDetailsState> {
  FetchMealDetailsCubit(this.homeRepo) : super(FetchMealDetailsInitial());
  final HomeRepo homeRepo;
  fetchMealDetails({required String id}) async {
    emit(FetchMealDetailsLoading());
    final result = await homeRepo.fetchMealDetails(id);
    result.fold(
      (failure) => emit(FetchMealDetailsFailure(failure.errMessage)),
      (meal) => emit(FetchMealDetailsSuccess(meal)),
    );
  }
}
