import 'package:dartz/dartz.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/my_love_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/repositories/interest_repository.dart';

class GetMyLoveUseCase {
  final InterestRepository repository;

  GetMyLoveUseCase({required this.repository});

  Future<Either<String, List<MyLoveEntity>>> execute() async {
    return await repository.getMyLove();
  }
}
