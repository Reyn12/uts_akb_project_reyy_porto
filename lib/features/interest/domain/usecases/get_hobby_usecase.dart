import 'package:dartz/dartz.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/hobby_entitiy.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/repositories/interest_repository.dart';

class GetHobbyUseCase {
  final InterestRepository repository;

  GetHobbyUseCase({required this.repository});

  Future<Either<String, List<HobbyEntity>>> execute() async {
    return await repository.getHobby();
  }
}
