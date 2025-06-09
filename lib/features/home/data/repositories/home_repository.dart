import 'package:dartz/dartz.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/user_profile_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/friend_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/activity_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<Either<String, UserProfileEntity>> getUserProfile() async {
    // Data dummy
    return Right(
      UserProfileEntity(
        name: 'Muhammad Renaldi',
        role: 'Mobile Developer & Tech Enthusiast',
        rating: 5.0,
        projects: 24,
        friends: 156,
        photos: 89,
        profilePictureUrl: 'assets/images/reyy.jpg',
        isOnline: true,
      ),
    );
  }

  @override
  Future<Either<String, List<FriendEntity>>> getFriends() async {
    // Data dummy
    return Right([
      FriendEntity(
        name: 'M Rizky',
        profilePictureUrl: 'assets/images/rizky.jpg',
        isOnline: true,
      ),
      FriendEntity(
        name: 'Hilmi Firdaus',
        profilePictureUrl: 'assets/images/hilmy.jpg',
        isOnline: true,
      ),
      FriendEntity(
        name: 'Bambang Yohanes',
        profilePictureUrl: 'assets/images/bambang.jpg',
        isOnline: true,
      ),
    ]);
  }

  @override
  Future<Either<String, List<ActivityEntity>>> getActivities() async {
    // Data dummy
    return Right([
      ActivityEntity(
        title: 'Morning Workout',
        time: '06:00 AM',
        status: ActivityStatus.ongoing,
      ),
      ActivityEntity(
        title: 'Team Meeting',
        time: '09:00 AM',
        status: ActivityStatus.upcoming,
      ),
      ActivityEntity(
        title: 'Lunch Break',
        time: '12:00 PM',
        status: ActivityStatus.upcoming,
      ),
    ]);
  }
}
