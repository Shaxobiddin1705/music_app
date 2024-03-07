import 'package:music_app/data/network/response/search_album_dto.dart';
import 'package:music_app/domain/model/search_album.dart';
import 'package:music_app/domain/repository/src/mapping/playlist.dart';

extension SearchAlbumDtoExt on SearchAlbumDto {
  SearchAlbum toSearching() {
    return SearchAlbum(
      id: id,
      title: title,
      titleShort: titleShort,
      duration: duration,
      rank: rank,
      preview: preview,
      artist: artist.toArtist(),
      album: album.toAlbum(),
      type: type,
    );
  }
}

extension ArtistDtoExt on ArtistDto {
  Artist toArtist() {
    return Artist(
      id: id,
      name: name,
      link: link,
      pictureSmall: pictureSmall,
      pictureMedium: pictureMedium,
      pictureBig: pictureBig,
      pictureXl: pictureXl,
      tracklist: tracklist,
      type: type,
    );
  }
}
