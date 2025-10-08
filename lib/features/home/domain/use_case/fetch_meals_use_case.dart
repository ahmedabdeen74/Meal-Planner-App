import 'package:dartz/dartz.dart';
import 'package:meal_planner/core/utility/errors/failures.dart';
import 'package:meal_planner/core/utility/use_case/use_case.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/home/domain/repo/home_repo.dart';


class FetchMealsUseCase extends UseCase<List<Meal>, int> {
  final HomeRepo homeRepo;

  FetchMealsUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<Meal>>> call([int? count]) {
    return homeRepo.fetchMeals(count: count ?? 8);
  }
}
