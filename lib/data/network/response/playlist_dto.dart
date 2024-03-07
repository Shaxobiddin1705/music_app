import 'package:json_annotation/json_annotation.dart';

part 'playlist_dto.g.dart';

@JsonSerializable()
class PlaylistDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "duration")
  final int duration;
  @JsonKey(name: "public")
  final bool public;
  @JsonKey(name: "is_loved_track")
  final bool isLovedTrack;
  @JsonKey(name: "collaborative")
  final bool collaborative;
  @JsonKey(name: "nb_tracks")
  final int nbTracks;
  @JsonKey(name: "fans")
  final int fans;
  @JsonKey(name: "link")
  final String link;
  @JsonKey(name: "share")
  final String share;
  @JsonKey(name: "picture")
  final String picture;
  @JsonKey(name: "picture_small")
  final String pictureSmall;
  @JsonKey(name: "picture_medium")
  final String pictureMedium;
  @JsonKey(name: "picture_big")
  final String pictureBig;
  @JsonKey(name: "picture_xl")
  final String pictureXl;
  @JsonKey(name: "checksum")
  final String checksum;
  @JsonKey(name: "tracklist")
  final String tracklist;
  @JsonKey(name: "creation_date")
  final String creationDate;
  @JsonKey(name: "md5_image")
  final String md5Image;
  @JsonKey(name: "picture_type")
  final String pictureType;
  @JsonKey(name: "creator")
  final CreatorDto creator;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "tracks")
  final TracksDto tracks;

  PlaylistDto({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.public,
    required this.isLovedTrack,
    required this.collaborative,
    required this.nbTracks,
    required this.fans,
    required this.link,
    required this.share,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.checksum,
    required this.tracklist,
    required this.creationDate,
    required this.md5Image,
    required this.pictureType,
    required this.creator,
    required this.type,
    required this.tracks,
  });

  factory PlaylistDto.fromJson(Map<String, dynamic> json) =>
      _$PlaylistDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistDtoToJson(this);
}

@JsonSerializable()
class CreatorDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "tracklist")
  final String tracklist;
  @JsonKey(name: "type")
  final String type;

  CreatorDto({
    required this.id,
    required this.name,
    required this.tracklist,
    required this.type,
  });

  factory CreatorDto.fromJson(Map<String, dynamic> json) =>
      _$CreatorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorDtoToJson(this);
}

@JsonSerializable()
class TracksDto {
  @JsonKey(name: "data")
  final List<DatumDto> data;
  @JsonKey(name: "checksum")
  final String checksum;

  TracksDto({
    required this.data,
    required this.checksum,
  });

  factory TracksDto.fromJson(Map<String, dynamic> json) =>
      _$TracksDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TracksDtoToJson(this);
}

@JsonSerializable()
class DatumDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "readable")
  final bool readable;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "title_short")
  final String titleShort;
  @JsonKey(name: "title_version")
  final String titleVersion;
  @JsonKey(name: "link")
  final String link;
  @JsonKey(name: "duration")
  final int duration;
  @JsonKey(name: "rank")
  final int rank;
  @JsonKey(name: "explicit_lyrics")
  final bool explicitLyrics;
  @JsonKey(name: "explicit_content_lyrics")
  final int explicitContentLyrics;
  @JsonKey(name: "explicit_content_cover")
  final int explicitContentCover;
  @JsonKey(name: "preview")
  final String preview;
  @JsonKey(name: "md5_image")
  final String md5Image;
  @JsonKey(name: "time_add")
  final int timeAdd;
  @JsonKey(name: "artist")
  final ArtistDto artist;
  @JsonKey(name: "album")
  final AlbumDto album;
  @JsonKey(name: "type")
  final String type;

  DatumDto({
    required this.id,
    required this.readable,
    required this.title,
    required this.titleShort,
    required this.titleVersion,
    required this.link,
    required this.duration,
    required this.rank,
    required this.explicitLyrics,
    required this.explicitContentLyrics,
    required this.explicitContentCover,
    required this.preview,
    required this.md5Image,
    required this.timeAdd,
    required this.artist,
    required this.album,
    required this.type,
  });

  factory DatumDto.fromJson(Map<String, dynamic> json) =>
      _$DatumDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DatumDtoToJson(this);
}

@JsonSerializable()
class AlbumDto {
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
  @JsonKey(name: "md5_image")
  final String md5Image;
  @JsonKey(name: "tracklist")
  final String tracklist;
  @JsonKey(name: "type")
  final String type;

  AlbumDto({
    required this.id,
    required this.title,
    required this.cover,
    required this.coverSmall,
    required this.coverMedium,
    required this.coverBig,
    required this.coverXl,
    required this.md5Image,
    required this.tracklist,
    required this.type,
  });

  factory AlbumDto.fromJson(Map<String, dynamic> json) =>
      _$AlbumDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumDtoToJson(this);
}

@JsonSerializable()
class ArtistDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "link")
  final String link;
  @JsonKey(name: "tracklist")
  final String tracklist;
  @JsonKey(name: "type")
  final String type;

  ArtistDto({
    required this.id,
    required this.name,
    required this.link,
    required this.tracklist,
    required this.type,
  });

  factory ArtistDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistDtoToJson(this);
}
