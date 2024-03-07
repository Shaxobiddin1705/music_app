import 'package:json_annotation/json_annotation.dart';
import 'package:music_app/data/network/response/playlist_dto.dart';

part 'main_album_dto.g.dart';

@JsonSerializable()
class MainAlbumDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "cover")
  final String cover;
  @JsonKey(name: "cover_small")
  final String coverSmall;
  @JsonKey(name: "cover_medium")
  final String coverMedium;
  @JsonKey(name: "cover_big")
  final String coverBig;
  @JsonKey(name: "cover_xl")
  final String coverXl;
  @JsonKey(name: "label")
  final String label;
  @JsonKey(name: "duration")
  final int duration;
  @JsonKey(name: "artist")
  final ArtistDto artist;
  @JsonKey(name: "fans")
  final int fans;
  @JsonKey(name: "release_date")
  final DateTime releaseDate;
  @JsonKey(name: "tracks")
  final TracksDto tracks;

  MainAlbumDto({
    required this.id,
    required this.title,
    required this.cover,
    required this.coverSmall,
    required this.coverMedium,
    required this.coverBig,
    required this.coverXl,
    required this.label,
    required this.duration,
    required this.artist,
    required this.fans,
    required this.releaseDate,
    required this.tracks,
  });

  factory MainAlbumDto.fromJson(Map<String, dynamic> json) =>
      _$MainAlbumDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MainAlbumDtoToJson(this);
}

@JsonSerializable()
class ArtistDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "picture")
  final String picture;
  @JsonKey(name: "picture_small")
  final String pictureSmall;
  @JsonKey(name: "picture_medium")
  final String pictureMedium;
  @JsonKey(name: "picture_big")
  final String pictureBig;
  @JsonKey(name: "picture_xl")
  final String pictureXL;

  ArtistDto({
    required this.id,
    required this.name,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXL,
  });

  factory ArtistDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistDtoToJson(this);
}

@JsonSerializable()
class TracksDto {
  @JsonKey(name: "data")
  final List<TrackDto> data;

  TracksDto({
    required this.data,
  });

  factory TracksDto.fromJson(Map<String, dynamic> json) =>
      _$TracksDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TracksDtoToJson(this);
}

@JsonSerializable()
class TrackDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "title_short")
  final String titleShort;
  @JsonKey(name: "duration")
  final int duration;
  @JsonKey(name: "preview")
  final String preview;
  @JsonKey(name: "album")
  final AlbumDto album;

  TrackDto({
    required this.id,
    required this.title,
    required this.titleShort,
    required this.duration,
    required this.preview,
    required this.album,
  });

  factory TrackDto.fromJson(Map<String, dynamic> json) =>
      _$TrackDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TrackDtoToJson(this);
}
