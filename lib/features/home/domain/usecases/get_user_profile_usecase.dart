import 'package:dartz/dartz.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/user_profile_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/repositories/home_repository.dart';

class GetUserProfileUseCase {
  final HomeRepository homeRepository;

  GetUserProfileUseCase({required this.homeRepository});

  Future<Either<String, UserProfileEntity>> execute() async {
    return homeRepository.getUserProfile();
  }
}
