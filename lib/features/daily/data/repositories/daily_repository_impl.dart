import 'package:uts_akb_project_reyy_portfo/features/daily/domain/entities/gallery_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/domain/entities/music_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/domain/repositories/daily_repository.dart';

class DailyRepositoryImpl implements DailyRepository {
  @override
  Future<List<GalleryEntity>> getGallery() async {
    // Simulasi delay network
    await Future.delayed(const Duration(milliseconds: 500));

    // Data dummy gallery
    return [
      GalleryEntity(imageUrl: 'assets/images/gallery/gallery1.jpeg'),
      GalleryEntity(imageUrl: 'assets/images/gallery/gallery2.jpeg'),
      GalleryEntity(imageUrl: 'assets/images/gallery/gallery3.jpeg'),
      GalleryEntity(imageUrl: 'assets/images/gallery/gallery4.jpeg'),
    ];
  }

  @override
  Future<List<MusicEntity>> getMusic() async {
    // Simulasi delay network
    await Future.delayed(const Duration(milliseconds: 500));

    // Data dummy music sesuai gambar
    return [
      MusicEntity(
        title: 'Midnight Dreams',
        artist: 'Luna Eclipse',
        imageUrl: 'assets/images/music/music1.jpeg',
      ),
      MusicEntity(
        title: 'Tech Tutorial 2024',
        artist: 'CodeMaster',
        imageUrl: 'assets/images/music/music2.jpeg',
      ),
      MusicEntity(
        title: 'Ocean Waves',
        artist: 'Nature Sounds',
        imageUrl: 'assets/images/music/music3.jpeg',
      ),
      MusicEntity(
        title: 'APT',
        artist: 'Rose x Bruno Mars',
        imageUrl: 'assets/images/music/music4.jpeg',
      ),
    ];
  }
}
