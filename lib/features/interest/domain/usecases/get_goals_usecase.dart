import 'package:dartz/dartz.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/goals_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/repositories/interest_repository.dart';

class GetGoalsUseCase {
  final InterestRepository repository;

  GetGoalsUseCase({required this.repository});

  Future<Either<String, List<GoalsEntity>>> execute() async {
    return await repository.getGoals();
  }
}
