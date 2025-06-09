import 'package:get/get.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/user_profile_entity.dart';

class ProfileController extends GetxController {
  final Rx<UserProfileEntity?> userProfile = Rx<UserProfileEntity?>(null);
  @override
  void onInit() {
    super.onInit();
    userProfile.value = UserProfileEntity(
      name: 'Muhammad Renaldi',
      role: 'Mobile Developer & Tech Enthusiast',
      rating: 5,
      projects: 0,
      friends: 0,
      photos: 0,
      profilePictureUrl: 'assets/images/reyy.jpg',
      isOnline: true,
    );
  }
}
