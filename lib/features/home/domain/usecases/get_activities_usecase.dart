import 'package:dartz/dartz.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/activity_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/repositories/home_repository.dart';

class GetActivitiesUseCase {
  final HomeRepository homeRepository;

  GetActivitiesUseCase({required this.homeRepository});

  Future<Either<String, List<ActivityEntity>>> execute() async {
    return homeRepository.getActivities();
  }
}
