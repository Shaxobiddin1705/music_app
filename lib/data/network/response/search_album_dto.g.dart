// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_album_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchAlbumListDto _$SearchAlbumListDtoFromJson(Map<String, dynamic> json) =>
    SearchAlbumListDto(
      albumList: (json['data'] as List<dynamic>)
          .map((e) => SearchAlbumDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      next: json['next'] as String,
    );

Map<String, dynamic> _$SearchAlbumListDtoToJson(SearchAlbumListDto instance) =>
    <String, dynamic>{
      'data': instance.albumList,
      'total': instance.total,
      'next': instance.next,
    };

SearchAlbumDto _$SearchAlbumDtoFromJson(Map<String, dynamic> json) =>
    SearchAlbumDto(
      id: json['id'] as int,
      title: json['title'] as String,
      titleShort: json['title_short'] as String,
      duration: json['duration'] as int,
      rank: json['rank'] as int,
      preview: json['preview'] as String,
      artist: ArtistDto.fromJson(json['artist'] as Map<String, dynamic>),
      album: AlbumDto.fromJson(json['album'] as Map<String, dynamic>),
      type: json['type'] as String,
    );

Map<String, dynamic> _$SearchAlbumDtoToJson(SearchAlbumDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title_short': instance.titleShort,
      'duration': instance.duration,
      'rank': instance.rank,
      'preview': instance.preview,
      'artist': instance.artist,
      'album': instance.album,
      'type': instance.type,
    };

ArtistDto _$ArtistDtoFromJson(Map<String, dynamic> json) => ArtistDto(
      id: json['id'] as int,
      name: json['name'] as String,
      link: json['link'] as String,
      picture: json['picture'] as String,
      pictureSmall: json['picture_small'] as String,
      pictureMedium: json['picture_medium'] as String,
      pictureBig: json['picture_big'] as String,
      pictureXl: json['picture_xl'] as String,
      tracklist: json['tracklist'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ArtistDtoToJson(ArtistDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'link': instance.link,
      'picture': instance.picture,
      'picture_small': instance.pictureSmall,
      'picture_medium': instance.pictureMedium,
      'picture_big': instance.pictureBig,
      'picture_xl': instance.pictureXl,
      'tracklist': instance.tracklist,
      'type': instance.type,
    };
