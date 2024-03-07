import 'package:json_annotation/json_annotation.dart';
import 'package:music_app/data/network/response/playlist_dto.dart';

part 'search_album_dto.g.dart';

@JsonSerializable()
class SearchAlbumListDto {
  @JsonKey(name: "data")
  final List<SearchAlbumDto> albumList;
  @JsonKey(name: "total")
  final int total;
  @JsonKey(name: "next")
  final String next;

  SearchAlbumListDto({
    required this.albumList,
    required this.total,
    required this.next,
  });

  factory SearchAlbumListDto.fromJson(Map<String, dynamic> json) =>
      _$SearchAlbumListDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchAlbumListDtoToJson(this);
}

@JsonSerializable()
class SearchAlbumDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "title_short")
  final String titleShort;
  @JsonKey(name: "duration")
  final int duration;
  @JsonKey(name: "rank")
  final int rank;
  @JsonKey(name: "preview")
  final String preview;
  @JsonKey(name: "artist")
  final ArtistDto artist;
  @JsonKey(name: "album")
  final AlbumDto album;
  @JsonKey(name: "type")
  final String type;

  SearchAlbumDto({
    required this.id,
    required this.title,
    required this.titleShort,
    required this.duration,
    required this.rank,
    required this.preview,
    required this.artist,
    required this.album,
    required this.type,
  });

  factory SearchAlbumDto.fromJson(Map<String, dynamic> json) =>
      _$SearchAlbumDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchAlbumDtoToJson(this);
}

@JsonSerializable()
class ArtistDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "link")
  final String link;
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
  @JsonKey(name: "tracklist")
  final String tracklist;
  @JsonKey(name: "type")
  final String type;

  ArtistDto({
    required this.id,
    required this.name,
    required this.link,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.tracklist,
    required this.type,
  });

  factory ArtistDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistDtoToJson(this);
}
