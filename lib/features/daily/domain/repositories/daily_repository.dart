import 'package:uts_akb_project_reyy_portfo/features/daily/domain/entities/gallery_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/domain/entities/music_entity.dart';

abstract class DailyRepository {
  Future<List<GalleryEntity>> getGallery();
  Future<List<MusicEntity>> getMusic();
}
