import 'package:get/get.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/data/repositories/interest_repository_impl.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/repositories/interest_repository.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/usecases/get_goals_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/usecases/get_hobby_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/usecases/get_my_love_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/usecases/get_not_my_love_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/presentation/controller/interest_controller.dart';

class InterestBinding extends Bindings {
  @override
  void dependencies() {
    // Repository
    Get.lazyPut<InterestRepository>(
      () => InterestRepositoryImpl(),
      fenix: true,
    );

    // Use Cases
    Get.lazyPut(
      () => GetGoalsUseCase(repository: Get.find<InterestRepository>()),
      fenix: true,
    );

    Get.lazyPut(
      () => GetMyLoveUseCase(repository: Get.find<InterestRepository>()),
      fenix: true,
    );

    Get.lazyPut(
      () => GetNotMyLoveUseCase(repository: Get.find<InterestRepository>()),
      fenix: true,
    );

    Get.lazyPut(
      () => GetHobbyUseCase(repository: Get.find<InterestRepository>()),
      fenix: true,
    );

    // Controller
    Get.lazyPut<InterestController>(
      () => InterestController(
        getGoalsUseCase: Get.find(),
        getMyLoveUseCase: Get.find(),
        getNotMyLoveUseCase: Get.find(),
        getHobbyUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
