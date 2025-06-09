import 'package:dartz/dartz.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/goals_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/hobby_entitiy.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/my_love_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/not_my_love_entity.dart';

abstract class InterestRepository {
  Future<Either<String, List<GoalsEntity>>> getGoals();
  Future<Either<String, List<MyLoveEntity>>> getMyLove();
  Future<Either<String, List<NotMyLoveEntity>>> getNotMyLove();
  Future<Either<String, List<HobbyEntity>>> getHobby();
}
