import 'package:audio_service/audio_service.dart';
import 'package:music_app/data/database/db/app_db.dart';
import 'package:music_app/data/network/response/main_album_dto.dart';
import 'package:music_app/domain/model/main_album.dart';

extension MainAlbumDtoExt on MainAlbumDto {
  MainAlbum toAlbum() {
    return MainAlbum(
      id: id,
      title: title,
      cover: cover,
      coverSmall: coverSmall,
      coverMedium: coverMedium,
      coverBig: coverBig,
      coverXl: coverXl,
      label: label,
      duration: duration,
      fans: fans,
      artist: artist.toArtist(),
      releaseDate: releaseDate,
      tracks: tracks.data.map((e) => e.toTrack(artist.name)).toList(),
    );
  }
}

extension ArtistDtoExt on ArtistDto {
  Artist toArtist() {
    return Artist(
      id: id,
      name: name,
      picture: picture,
      pictureSmall: pictureSmall,
      pictureMedium: pictureMedium,
      pictureBig: pictureBig,
      pictureXL: pictureXL,
    );
  }
}

extension TrackDtoExt on TrackDto {
  Track toTrack(String artist) {
    return Track(
      id: id,
      title: title,
      preview: preview,
      artist: artist,
      albumTitle: album.title,
      networkImage: album.coverMedium,
    );
  }
}

extension MediaItemExt on Track {
  MediaItem toMediaItem() {
    return MediaItem(
      id: '$id',
      title: title,
      album: albumTitle,
      extras: {'url': preview, 'file': music, 'image': networkImage},
    );
  }
}

extension TrackDaoExt on TrackEntityData {
  Track toTrack(String artist) {
    return Track(
      id: id,
      title: title,
      music: music,
      albumTitle: albumTitle,
      artist: artist,
      image: image,
    );
  }
}

extension TrackExt on Track {
  TrackEntityData toEntityData() {
    return TrackEntityData(
      id: id,
      title: title,
      music: music!,
      artist: artist,
      image: image!,
      albumTitle: albumTitle,
    );
  }
}
