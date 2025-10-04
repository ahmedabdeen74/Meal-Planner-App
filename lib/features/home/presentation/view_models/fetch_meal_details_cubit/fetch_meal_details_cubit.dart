import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/home/domain/use_case/fetch_meal_details.dart';

part 'fetch_meal_details_state.dart';

class FetchMealDetailsCubit extends Cubit<FetchMealDetailsState> {
  FetchMealDetailsCubit(this.useCase) : super(FetchMealDetailsInitial());
  final FetchMealDetailsUseCase useCase;
  fetchMealDetails({required String id}) async {
    emit(FetchMealDetailsLoading());
    final result = await useCase.call(id);
    result.fold(
      (failure) => emit(FetchMealDetailsFailure(failure.errMessage)),
      (meal) => emit(FetchMealDetailsSuccess(meal)),
    );
  }
}
