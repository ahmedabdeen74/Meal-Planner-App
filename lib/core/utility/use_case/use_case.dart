import 'package:dartz/dartz.dart';
import 'package:meal_planner/core/utility/errors/failures.dart';
import 'package:meal_planner/features/home/domain/repo/home_repo.dart';
// clean architecture use case class
abstract class UseCase<Type,Param> {

  Future<Either<Failure, Type>> call([Param params]);
}
class NoParams {}
