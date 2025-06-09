import 'package:dartz/dartz.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/goals_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/hobby_entitiy.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/my_love_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/not_my_love_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/repositories/interest_repository.dart';

class InterestRepositoryImpl implements InterestRepository {
  @override
  Future<Either<String, List<GoalsEntity>>> getGoals() async {
    return Right([
      GoalsEntity(id: 1, title: 'Senior Flutter Develop'),
      GoalsEntity(id: 2, title: 'Mentor/Dosen Android Developer'),
      GoalsEntity(id: 3, title: 'Gaji up to 40k USD'),
      GoalsEntity(id: 4, title: 'Work in Singapore'),
      GoalsEntity(id: 5, title: 'Tiap hari nge grill'),
    ]);
  }

  @override
  Future<Either<String, List<MyLoveEntity>>> getMyLove() async {
    return Right([
      MyLoveEntity(id: 1, title: 'Coffe'),
      MyLoveEntity(id: 2, title: 'Mountains'),
      MyLoveEntity(id: 3, title: 'Technology'),
      MyLoveEntity(id: 4, title: 'Games'),
      MyLoveEntity(id: 5, title: 'Coding'),
      MyLoveEntity(id: 6, title: 'Healing'),
    ]);
  }

  @override
  Future<Either<String, List<NotMyLoveEntity>>> getNotMyLove() async {
    return Right([
      NotMyLoveEntity(id: 1, title: 'Alcohol'),
      NotMyLoveEntity(id: 2, title: 'Smoking'),
      NotMyLoveEntity(id: 3, title: 'Crowded Place'),
    ]);
  }

  @override
  Future<Either<String, List<HobbyEntity>>> getHobby() async {
    return Right([
      HobbyEntity(id: 1, title: 'Ngoding Flutter'),
      HobbyEntity(id: 2, title: 'Renang'),
      HobbyEntity(id: 3, title: 'Tidur'),
      HobbyEntity(id: 4, title: 'Makan'),
      HobbyEntity(id: 5, title: 'Ngoding Riek Natip'),
    ]);
  }
}
