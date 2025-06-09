import 'package:get/get.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/data/repositories/home_repository.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/repositories/home_repository.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/usecases/get_activities_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/usecases/get_friends_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/usecases/get_user_profile_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Repository
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl());

    // UseCases
    Get.lazyPut(() => GetUserProfileUseCase(homeRepository: Get.find()));
    Get.lazyPut(() => GetFriendsUseCase(homeRepository: Get.find()));
    Get.lazyPut(() => GetActivitiesUseCase(homeRepository: Get.find()));

    // Controller
    Get.lazyPut(
      () => HomeController(
        getUserProfileUseCase: Get.find(),
        getFriendsUseCase: Get.find(),
        getActivitiesUseCase: Get.find(),
      ),
    );
  }
}
