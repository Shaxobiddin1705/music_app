import 'package:music_app/data/network/response/playlist_dto.dart';
import 'package:music_app/domain/model/playlist_model.dart';

extension PlaylistDtoExt on PlaylistDto {
  Playlist toMap() {
    return Playlist(
      id: id,
      title: title,
      description: description,
      duration: duration,
      pictureSmall: pictureSmall,
      pictureMedium: pictureMedium,
      pictureBig: pictureBig,
      pictureXl: pictureXl,
      checksum: checksum,
      creationDate: creationDate,
      tracks: tracks.toTracks(),
    );
  }
}

extension TracksDtoExt on TracksDto {
  Tracks toTracks() {
    return Tracks(data: data.map((e) => e.toDatum()).toList());
  }
}

extension DatumDtoExt on DatumDto {
  Datum toDatum() {
    return Datum(
      id: id,
      title: title,
      titleShort: titleShort,
      duration: duration,
      rank: rank,
      preview: preview,
      album: album.toAlbum(),
    );
  }
}

extension AlbumDtoExt on AlbumDto {
  Album toAlbum() {
    return Album(
      id: id,
      title: title,
      cover: cover,
      coverSmall: coverSmall,
      coverMedium: coverMedium,
      coverBig: coverBig,
      coverXl: coverXl,
    );
  }
}