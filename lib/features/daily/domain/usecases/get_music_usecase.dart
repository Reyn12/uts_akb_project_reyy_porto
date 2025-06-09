import 'package:uts_akb_project_reyy_portfo/features/daily/domain/entities/music_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/domain/repositories/daily_repository.dart';

class GetMusicUseCase {
  final DailyRepository repository;

  GetMusicUseCase(this.repository);

  Future<List<MusicEntity>> execute() async {
    return repository.getMusic();
  }
}
