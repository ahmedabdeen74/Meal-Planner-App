part of 'fetch_meal_details_cubit.dart';

sealed class FetchMealDetailsState extends Equatable {
  const FetchMealDetailsState();

  @override
  List<Object> get props => [];
}

final class FetchMealDetailsInitial extends FetchMealDetailsState {}
final class FetchMealDetailsLoading extends FetchMealDetailsState {}
final class FetchMealDetailsSuccess extends FetchMealDetailsState {
  final Meal meal;

  const FetchMealDetailsSuccess(this.meal);


}
final class FetchMealDetailsFailure extends FetchMealDetailsState {
  final String errorMessage;
  const FetchMealDetailsFailure(this.errorMessage);

}
