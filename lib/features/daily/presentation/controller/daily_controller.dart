import 'package:get/get.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/domain/entities/gallery_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/domain/entities/music_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/domain/usecases/get_gallery_usecase.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/domain/usecases/get_music_usecase.dart';

class DailyController extends GetxController {
  final GetGalleryUseCase getGalleryUseCase;
  final GetMusicUseCase getMusicUseCase;

  // State untuk loading
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  // State untuk data
  final galleryList = <GalleryEntity>[].obs;
  final musicList = <MusicEntity>[].obs;

  DailyController({
    required this.getGalleryUseCase,
    required this.getMusicUseCase,
  });

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  // Method untuk mengambil data gallery dan music
  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      // Ambil data gallery dan music secara paralel
      final results = await Future.wait([
        getGalleryUseCase.execute(),
        getMusicUseCase.execute(),
      ]);

      // Update state
      galleryList.assignAll(results[0] as List<GalleryEntity>);
      musicList.assignAll(results[1] as List<MusicEntity>);
    } catch (e) {
      errorMessage.value = 'Gagal memuat data: $e';
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  // Method untuk refresh data
  Future<void> refreshData() async {
    await fetchData();
  }
}
