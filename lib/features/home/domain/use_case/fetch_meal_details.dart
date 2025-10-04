import 'package:dartz/dartz.dart';
import 'package:meal_planner/core/utility/errors/failures.dart';
import 'package:meal_planner/core/utility/use_case/use_case.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:meal_planner/features/home/domain/repo/home_repo.dart';

class FetchMealDetailsUseCase extends UseCase<Meal,String> {
  final HomeRepo homeRepo;

  FetchMealDetailsUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, Meal>> call([String? id]) async{
    return await homeRepo.fetchMealDetails(id ?? '');
  }
}
