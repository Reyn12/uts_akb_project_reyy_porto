import 'package:get/get.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/goals_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/hobby_entitiy.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/my_love_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/not_my_love_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/usecases/get_goals_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/usecases/get_hobby_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/usecases/get_my_love_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/usecases/get_not_my_love_usecase.dart';

class InterestController extends GetxController {
  final GetGoalsUseCase getGoalsUseCase;
  final GetMyLoveUseCase getMyLoveUseCase;
  final GetNotMyLoveUseCase getNotMyLoveUseCase;
  final GetHobbyUseCase getHobbyUseCase;

  final isLoading = false.obs;
  final error = ''.obs;

  // Reactive lists untuk menyimpan data
  final RxList<GoalsEntity> goalsList = <GoalsEntity>[].obs;
  final RxList<MyLoveEntity> myLoveList = <MyLoveEntity>[].obs;
  final RxList<NotMyLoveEntity> notMyLoveList = <NotMyLoveEntity>[].obs;
  final RxList<HobbyEntity> hobbyList = <HobbyEntity>[].obs;

  InterestController({
    required this.getGoalsUseCase,
    required this.getMyLoveUseCase,
    required this.getNotMyLoveUseCase,
    required this.getHobbyUseCase,
  });

  @override
  void onInit() {
    super.onInit();
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    isLoading.value = true;

    try {
      await Future.wait([
        fetchGoals(),
        fetchMyLove(),
        fetchNotMyLove(),
        fetchHobbies(),
      ]);
    } catch (e) {
      error.value = 'Failed to load data: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchGoals() async {
    final result = await getGoalsUseCase.execute();
    result.fold(
      (failure) => error.value = 'Failed to load goals: $failure',
      (goals) => goalsList.value = goals,
    );
  }

  Future<void> fetchMyLove() async {
    final result = await getMyLoveUseCase.execute();
    result.fold(
      (failure) => error.value = 'Failed to load my love: $failure',
      (loves) => myLoveList.value = loves,
    );
  }

  Future<void> fetchNotMyLove() async {
    final result = await getNotMyLoveUseCase.execute();
    result.fold(
      (failure) => error.value = 'Failed to load not my love: $failure',
      (notLoves) => notMyLoveList.value = notLoves,
    );
  }

  Future<void> fetchHobbies() async {
    final result = await getHobbyUseCase.execute();
    result.fold(
      (failure) => error.value = 'Failed to load hobbies: $failure',
      (hobbies) => hobbyList.value = hobbies,
    );
  }
}
