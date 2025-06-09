import 'package:dartz/dartz.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/not_my_love_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/repositories/interest_repository.dart';

class GetNotMyLoveUseCase {
  final InterestRepository repository;

  GetNotMyLoveUseCase({required this.repository});

  Future<Either<String, List<NotMyLoveEntity>>> execute() async {
    return await repository.getNotMyLove();
  }
}
