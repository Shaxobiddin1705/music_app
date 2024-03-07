import 'package:music_app/data/network/network.dart';
import 'package:music_app/data/network/response/main_album_dto.dart';
import 'package:music_app/data/network/response/search_album_dto.dart';

abstract class AlbumProvider extends BaseProvider {
  Future<ApiResponse<MainAlbumDto>> fetchAlbum(int id);

  Future<ApiResponse<List<SearchAlbumDto>>> search(String text);
}
