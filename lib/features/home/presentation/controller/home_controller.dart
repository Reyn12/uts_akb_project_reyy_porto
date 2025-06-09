import 'package:get/get.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/user_profile_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/friend_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/activity_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/usecases/get_user_profile_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/usecases/get_friends_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/usecases/get_activities_usecase.dart';

class HomeController extends GetxController {
  final GetUserProfileUseCase getUserProfileUseCase;
  final GetFriendsUseCase getFriendsUseCase;
  final GetActivitiesUseCase getActivitiesUseCase;

  // Observable state
  final Rx<UserProfileEntity?> userProfile = Rx<UserProfileEntity?>(null);
  final RxList<FriendEntity> friends = <FriendEntity>[].obs;
  final RxList<ActivityEntity> activities = <ActivityEntity>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  HomeController({
    required this.getUserProfileUseCase,
    required this.getFriendsUseCase,
    required this.getActivitiesUseCase,
  });

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 1), () async {
      await fetchAllData();
      isLoading.value = false;
    });
  }

  Future<void> fetchAllData() async {
    await Future.wait([fetchUserProfile(), fetchFriends(), fetchActivities()]);
  }

  Future<void> fetchUserProfile() async {
    isLoading.value = true;
    final result = await getUserProfileUseCase.execute();
    result.fold(
      (error) => errorMessage.value = error,
      (data) => userProfile.value = data,
    );
    isLoading.value = false;
  }

  Future<void> fetchFriends() async {
    final result = await getFriendsUseCase.execute();
    result.fold(
      (error) => errorMessage.value = error,
      (data) => friends.assignAll(data),
    );
  }

  Future<void> fetchActivities() async {
    final result = await getActivitiesUseCase.execute();
    result.fold(
      (error) => errorMessage.value = error,
      (data) => activities.assignAll(data),
    );
  }
}
