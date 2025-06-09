import 'package:dartz/dartz.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/friend_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/repositories/home_repository.dart';

class GetFriendsUseCase {
  final HomeRepository homeRepository;

  GetFriendsUseCase({required this.homeRepository});

  Future<Either<String, List<FriendEntity>>> execute() async {
    return homeRepository.getFriends();
  }
}
