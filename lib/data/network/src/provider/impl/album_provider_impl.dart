import 'package:dio/dio.dart';
import 'package:music_app/data/network/response/base_response.dart';
import 'package:music_app/data/network/response/main_album_dto.dart';
import 'package:music_app/data/network/response/search_album_dto.dart';
import 'package:music_app/data/network/src/endpoints/endpoints.dart';
import 'package:music_app/data/network/src/provider/album_provider.dart';

class AlbumProviderImpl extends AlbumProvider {
  final Dio apiClient;

  AlbumProviderImpl(this.apiClient);

  @override
  Future<ApiResponse<List<SearchAlbumDto>>> search(String text) {
    return apiCall(
      apiClient.get(
        Endpoints.search,
        queryParameters: {'q': text},
      ),
      dataFromJson: (data) => SearchAlbumListDto.fromJson(data).albumList,
    );
  }

  @override
  Future<ApiResponse<MainAlbumDto>> fetchAlbum(int id) {
    return apiCall(
      apiClient.get(Endpoints.album(id)),
      dataFromJson: (data) {
        return MainAlbumDto.fromJson(data as Map<String, dynamic>);
      },
    );
  }
}
