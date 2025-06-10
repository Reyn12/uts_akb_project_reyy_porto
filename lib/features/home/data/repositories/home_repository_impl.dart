import 'package:dartz/dartz.dart';
import 'package:uts_akb_project_reyy_portfo/core/error/exception.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/data/datasources/friend_remote_ds.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/data/datasources/user_profile_remote_ds.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/user_profile_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/friend_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/activity_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final UserProfileRemoteDataSource userProfileRemoteDataSource;
  final FriendRemoteDataSource friendRemoteDataSource;

  HomeRepositoryImpl({
    required this.userProfileRemoteDataSource,
    required this.friendRemoteDataSource,
  });

  @override
  Future<Either<String, UserProfileEntity>> getUserProfile() async {
    try {
      final result = await userProfileRemoteDataSource.getUserProfile();
      return Right(
        result,
      ); // UserProfileModel otomatis di-cast ke UserProfileEntity
    } on ServerException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left('Terjadi kesalahan yang tidak terduga');
    }
  }

  /*
  // Contoh implementasi langsung return entity dengan data dummy
  @override
  Future<Either<String, UserProfileEntity>> getUserProfile() async {
    try {
      // Data dummy langsung dalam bentuk entity
      final userEntity = UserProfileEntity(
        name: 'Muhammad Renaldi',
        role: 'Mobile Developer',
        rating: 4.9,
        projects: 24,
        friends: 156,
        photos: 89,
        profilePictureUrl: 'assets/images/reyy.jpg',
        isOnline: true,
      );
      
      return Right(userEntity);
    } catch (e) {
      return Left('Terjadi kesalahan: $e');
    }
  }
  */

  @override
  Future<Either<String, List<FriendEntity>>> getFriends() async {
    try {
      final result = await friendRemoteDataSource.getFriends();
      return Right(result);
    } on ServerException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left('Terjadi kesalahan yang tidak terduga');
    }
  }

  // @override
  // Future<Either<String, List<FriendEntity>>> getFriends() async {
  //   // Data dummy
  //   return Right([
  //     FriendEntity(
  //       name: 'M Rizky',
  //       profilePictureUrl: 'assets/images/rizky.jpeg',
  //       isOnline: true,
  //     ),
  //     FriendEntity(
  //       name: 'Hilmi Firdaus',
  //       profilePictureUrl: 'assets/images/hilmy.jpeg',
  //       isOnline: true,
  //     ),
  //     FriendEntity(
  //       name: 'Bambang Yohanes',
  //       profilePictureUrl: 'assets/images/bambang.jpeg',
  //       isOnline: true,
  //     ),
  //   ]);
  // }

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
