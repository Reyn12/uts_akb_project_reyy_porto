import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:uts_akb_project_reyy_portfo/features/home/data/datasources/friend_remote_ds.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/data/datasources/user_profile_remote_ds.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/data/repositories/home_repository_impl.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/repositories/home_repository.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/usecases/get_activities_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/usecases/get_friends_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/usecases/get_user_profile_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // HTTP Client
    Get.lazyPut(() => http.Client());

    // Data Sources
    Get.lazyPut<UserProfileRemoteDataSource>(
      () => UserProfileRemoteDataSourceImpl(
        client: Get.find(),
        baseUrl: 'https://6847fb40ec44b9f3493f1e0c.mockapi.io',
      ),
    );

    Get.lazyPut<FriendRemoteDataSource>(
      () => FriendRemoteDataSourceImpl(
        client: Get.find(),
        baseUrl: 'https://6847fb40ec44b9f3493f1e0c.mockapi.io',
      ),
    );

    // Repositories
    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImpl(
        userProfileRemoteDataSource: Get.find(),
        friendRemoteDataSource: Get.find(),
      ),
    );

    // Use Cases
    Get.lazyPut(() => GetUserProfileUseCase(homeRepository: Get.find()));
    Get.lazyPut(() => GetActivitiesUseCase(homeRepository: Get.find()));
    Get.lazyPut(() => GetFriendsUseCase(homeRepository: Get.find()));

    // Controller
    Get.lazyPut(
      () => HomeController(
        getUserProfileUseCase: Get.find(),
        getActivitiesUseCase: Get.find(),
        getFriendsUseCase: Get.find(),
      ),
    );
  }
}

// Tanggal : 10 Juni 2025
// Nama : Muhammad Renaldi Maulana
// NIM : 10122002
// Kelas : IF-1
