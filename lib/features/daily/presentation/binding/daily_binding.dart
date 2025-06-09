import 'package:get/get.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/data/repositories/daily_repository_impl.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/domain/repositories/daily_repository.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/domain/usecases/get_gallery_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/domain/usecases/get_music_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/presentation/controller/daily_controller.dart';

class DailyBinding extends Bindings {
  @override
  void dependencies() {
    // Repository
    Get.lazyPut<DailyRepository>(() => DailyRepositoryImpl(), fenix: true);

    // Use Cases
    Get.lazyPut(
      () => GetGalleryUseCase(Get.find<DailyRepository>()),
      fenix: true,
    );

    Get.lazyPut(
      () => GetMusicUseCase(Get.find<DailyRepository>()),
      fenix: true,
    );

    // Controller
    Get.lazyPut<DailyController>(
      () => DailyController(
        getGalleryUseCase: Get.find(),
        getMusicUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
