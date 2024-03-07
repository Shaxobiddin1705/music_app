// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistDto _$PlaylistDtoFromJson(Map<String, dynamic> json) => PlaylistDto(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      duration: json['duration'] as int,
      public: json['public'] as bool,
      isLovedTrack: json['is_loved_track'] as bool,
      collaborative: json['collaborative'] as bool,
      nbTracks: json['nb_tracks'] as int,
      fans: json['fans'] as int,
      link: json['link'] as String,
      share: json['share'] as String,
      picture: json['picture'] as String,
      pictureSmall: json['picture_small'] as String,
      pictureMedium: json['picture_medium'] as String,
      pictureBig: json['picture_big'] as String,
      pictureXl: json['picture_xl'] as String,
      checksum: json['checksum'] as String,
      tracklist: json['tracklist'] as String,
      creationDate: json['creation_date'] as String,
      md5Image: json['md5_image'] as String,
      pictureType: json['picture_type'] as String,
      creator: CreatorDto.fromJson(json['creator'] as Map<String, dynamic>),
      type: json['type'] as String,
      tracks: TracksDto.fromJson(json['tracks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaylistDtoToJson(PlaylistDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'duration': instance.duration,
      'public': instance.public,
      'is_loved_track': instance.isLovedTrack,
      'collaborative': instance.collaborative,
      'nb_tracks': instance.nbTracks,
      'fans': instance.fans,
      'link': instance.link,
      'share': instance.share,
      'picture': instance.picture,
      'picture_small': instance.pictureSmall,
      'picture_medium': instance.pictureMedium,
      'picture_big': instance.pictureBig,
      'picture_xl': instance.pictureXl,
      'checksum': instance.checksum,
      'tracklist': instance.tracklist,
      'creation_date': instance.creationDate,
      'md5_image': instance.md5Image,
      'picture_type': instance.pictureType,
      'creator': instance.creator,
      'type': instance.type,
      'tracks': instance.tracks,
    };

CreatorDto _$CreatorDtoFromJson(Map<String, dynamic> json) => CreatorDto(
      id: json['id'] as int,
      name: json['name'] as String,
      tracklist: json['tracklist'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$CreatorDtoToJson(CreatorDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tracklist': instance.tracklist,
      'type': instance.type,
    };

TracksDto _$TracksDtoFromJson(Map<String, dynamic> json) => TracksDto(
      data: (json['data'] as List<dynamic>)
          .map((e) => DatumDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      checksum: json['checksum'] as String,
    );

Map<String, dynamic> _$TracksDtoToJson(TracksDto instance) => <String, dynamic>{
      'data': instance.data,
      'checksum': instance.checksum,
    };

DatumDto _$DatumDtoFromJson(Map<String, dynamic> json) => DatumDto(
      id: json['id'] as int,
      readable: json['readable'] as bool,
      title: json['title'] as String,
      titleShort: json['title_short'] as String,
      titleVersion: json['title_version'] as String,
      link: json['link'] as String,
      duration: json['duration'] as int,
      rank: json['rank'] as int,
      explicitLyrics: json['explicit_lyrics'] as bool,
      explicitContentLyrics: json['explicit_content_lyrics'] as int,
      explicitContentCover: json['explicit_content_cover'] as int,
      preview: json['preview'] as String,
      md5Image: json['md5_image'] as String,
      timeAdd: json['time_add'] as int,
      artist: ArtistDto.fromJson(json['artist'] as Map<String, dynamic>),
      album: AlbumDto.fromJson(json['album'] as Map<String, dynamic>),
      type: json['type'] as String,
    );

Map<String, dynamic> _$DatumDtoToJson(DatumDto instance) => <String, dynamic>{
      'id': instance.id,
      'readable': instance.readable,
      'title': instance.title,
      'title_short': instance.titleShort,
      'title_version': instance.titleVersion,
      'link': instance.link,
      'duration': instance.duration,
      'rank': instance.rank,
      'explicit_lyrics': instance.explicitLyrics,
      'explicit_content_lyrics': instance.explicitContentLyrics,
      'explicit_content_cover': instance.explicitContentCover,
      'preview': instance.preview,
      'md5_image': instance.md5Image,
      'time_add': instance.timeAdd,
      'artist': instance.artist,
      'album': instance.album,
      'type': instance.type,
    };

AlbumDto _$AlbumDtoFromJson(Map<String, dynamic> json) => AlbumDto(
      id: json['id'] as int,
      title: json['title'] as String,
      cover: json['cover'] as String,
      coverSmall: json['cover_small'] as String,
      coverMedium: json['cover_medium'] as String,
      coverBig: json['cover_big'] as String,
      coverXl: json['cover_xl'] as String,
      md5Image: json['md5_image'] as String,
      tracklist: json['tracklist'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$AlbumDtoToJson(AlbumDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
      'cover_small': instance.coverSmall,
      'cover_medium': instance.coverMedium,
      'cover_big': instance.coverBig,
      'cover_xl': instance.coverXl,
      'md5_image': instance.md5Image,
      'tracklist': instance.tracklist,
      'type': instance.type,
    };

ArtistDto _$ArtistDtoFromJson(Map<String, dynamic> json) => ArtistDto(
      id: json['id'] as int,
      name: json['name'] as String,
      link: json['link'] as String,
      tracklist: json['tracklist'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ArtistDtoToJson(ArtistDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'link': instance.link,
      'tracklist': instance.tracklist,
      'type': instance.type,
    };
