import 'package:dartz/dartz.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/activity_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/friend_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/user_profile_entity.dart';

abstract class HomeRepository {
  Future<Either<String, UserProfileEntity>> getUserProfile();
  Future<Either<String, List<FriendEntity>>> getFriends();
  Future<Either<String, List<ActivityEntity>>> getActivities();
}
