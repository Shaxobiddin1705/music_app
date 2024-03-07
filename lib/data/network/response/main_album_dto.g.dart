// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_album_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainAlbumDto _$MainAlbumDtoFromJson(Map<String, dynamic> json) => MainAlbumDto(
      id: json['id'] as int,
      title: json['title'] as String,
      cover: json['cover'] as String,
      coverSmall: json['cover_small'] as String,
      coverMedium: json['cover_medium'] as String,
      coverBig: json['cover_big'] as String,
      coverXl: json['cover_xl'] as String,
      label: json['label'] as String,
      duration: json['duration'] as int,
      artist: ArtistDto.fromJson(json['artist'] as Map<String, dynamic>),
      fans: json['fans'] as int,
      releaseDate: DateTime.parse(json['release_date'] as String),
      tracks: TracksDto.fromJson(json['tracks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainAlbumDtoToJson(MainAlbumDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
      'cover_small': instance.coverSmall,
      'cover_medium': instance.coverMedium,
      'cover_big': instance.coverBig,
      'cover_xl': instance.coverXl,
      'label': instance.label,
      'duration': instance.duration,
      'artist': instance.artist,
      'fans': instance.fans,
      'release_date': instance.releaseDate.toIso8601String(),
      'tracks': instance.tracks,
    };

ArtistDto _$ArtistDtoFromJson(Map<String, dynamic> json) => ArtistDto(
      id: json['id'] as int,
      name: json['name'] as String,
      picture: json['picture'] as String,
      pictureSmall: json['picture_small'] as String,
      pictureMedium: json['picture_medium'] as String,
      pictureBig: json['picture_big'] as String,
      pictureXL: json['picture_xl'] as String,
    );

Map<String, dynamic> _$ArtistDtoToJson(ArtistDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture': instance.picture,
      'picture_small': instance.pictureSmall,
      'picture_medium': instance.pictureMedium,
      'picture_big': instance.pictureBig,
      'picture_xl': instance.pictureXL,
    };

TracksDto _$TracksDtoFromJson(Map<String, dynamic> json) => TracksDto(
      data: (json['data'] as List<dynamic>)
          .map((e) => TrackDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TracksDtoToJson(TracksDto instance) => <String, dynamic>{
      'data': instance.data,
    };

TrackDto _$TrackDtoFromJson(Map<String, dynamic> json) => TrackDto(
      id: json['id'] as int,
      title: json['title'] as String,
      titleShort: json['title_short'] as String,
      duration: json['duration'] as int,
      preview: json['preview'] as String,
      album: AlbumDto.fromJson(json['album'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrackDtoToJson(TrackDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title_short': instance.titleShort,
      'duration': instance.duration,
      'preview': instance.preview,
      'album': instance.album,
    };
