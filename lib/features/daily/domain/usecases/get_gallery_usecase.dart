import 'package:uts_akb_project_reyy_portfo/features/daily/domain/entities/gallery_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/domain/repositories/daily_repository.dart';

class GetGalleryUseCase {
  final DailyRepository repository;

  GetGalleryUseCase(this.repository);

  Future<List<GalleryEntity>> execute() async {
    return repository.getGallery();
  }
}
