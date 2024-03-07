// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $TrackEntityTable extends TrackEntity
    with TableInfo<$TrackEntityTable, TrackEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrackEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _albumTitleMeta =
      const VerificationMeta('albumTitle');
  @override
  late final GeneratedColumn<String> albumTitle = GeneratedColumn<String>(
      'album_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _musicMeta = const VerificationMeta('music');
  @override
  late final GeneratedColumn<Uint8List> music = GeneratedColumn<Uint8List>(
      'music', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<Uint8List> image = GeneratedColumn<Uint8List>(
      'image', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _artistMeta = const VerificationMeta('artist');
  @override
  late final GeneratedColumn<String> artist = GeneratedColumn<String>(
      'artist', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, albumTitle, music, image, artist];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'track';
  @override
  VerificationContext validateIntegrity(Insertable<TrackEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('album_title')) {
      context.handle(
          _albumTitleMeta,
          albumTitle.isAcceptableOrUnknown(
              data['album_title']!, _albumTitleMeta));
    } else if (isInserting) {
      context.missing(_albumTitleMeta);
    }
    if (data.containsKey('music')) {
      context.handle(
          _musicMeta, music.isAcceptableOrUnknown(data['music']!, _musicMeta));
    } else if (isInserting) {
      context.missing(_musicMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('artist')) {
      context.handle(_artistMeta,
          artist.isAcceptableOrUnknown(data['artist']!, _artistMeta));
    } else if (isInserting) {
      context.missing(_artistMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrackEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrackEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      albumTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}album_title'])!,
      music: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}music'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}image'])!,
      artist: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artist'])!,
    );
  }

  @override
  $TrackEntityTable createAlias(String alias) {
    return $TrackEntityTable(attachedDatabase, alias);
  }
}

class TrackEntityData extends DataClass implements Insertable<TrackEntityData> {
  final int id;
  final String title;
  final String albumTitle;
  final Uint8List music;
  final Uint8List image;
  final String artist;
  const TrackEntityData(
      {required this.id,
      required this.title,
      required this.albumTitle,
      required this.music,
      required this.image,
      required this.artist});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['album_title'] = Variable<String>(albumTitle);
    map['music'] = Variable<Uint8List>(music);
    map['image'] = Variable<Uint8List>(image);
    map['artist'] = Variable<String>(artist);
    return map;
  }

  TrackEntityCompanion toCompanion(bool nullToAbsent) {
    return TrackEntityCompanion(
      id: Value(id),
      title: Value(title),
      albumTitle: Value(albumTitle),
      music: Value(music),
      image: Value(image),
      artist: Value(artist),
    );
  }

  factory TrackEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrackEntityData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      albumTitle: serializer.fromJson<String>(json['albumTitle']),
      music: serializer.fromJson<Uint8List>(json['music']),
      image: serializer.fromJson<Uint8List>(json['image']),
      artist: serializer.fromJson<String>(json['artist']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'albumTitle': serializer.toJson<String>(albumTitle),
      'music': serializer.toJson<Uint8List>(music),
      'image': serializer.toJson<Uint8List>(image),
      'artist': serializer.toJson<String>(artist),
    };
  }

  TrackEntityData copyWith(
          {int? id,
          String? title,
          String? albumTitle,
          Uint8List? music,
          Uint8List? image,
          String? artist}) =>
      TrackEntityData(
        id: id ?? this.id,
        title: title ?? this.title,
        albumTitle: albumTitle ?? this.albumTitle,
        music: music ?? this.music,
        image: image ?? this.image,
        artist: artist ?? this.artist,
      );
  @override
  String toString() {
    return (StringBuffer('TrackEntityData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('albumTitle: $albumTitle, ')
          ..write('music: $music, ')
          ..write('image: $image, ')
          ..write('artist: $artist')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, albumTitle,
      $driftBlobEquality.hash(music), $driftBlobEquality.hash(image), artist);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrackEntityData &&
          other.id == this.id &&
          other.title == this.title &&
          other.albumTitle == this.albumTitle &&
          $driftBlobEquality.equals(other.music, this.music) &&
          $driftBlobEquality.equals(other.image, this.image) &&
          other.artist == this.artist);
}

class TrackEntityCompanion extends UpdateCompanion<TrackEntityData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> albumTitle;
  final Value<Uint8List> music;
  final Value<Uint8List> image;
  final Value<String> artist;
  const TrackEntityCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.albumTitle = const Value.absent(),
    this.music = const Value.absent(),
    this.image = const Value.absent(),
    this.artist = const Value.absent(),
  });
  TrackEntityCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String albumTitle,
    required Uint8List music,
    required Uint8List image,
    required String artist,
  })  : title = Value(title),
        albumTitle = Value(albumTitle),
        music = Value(music),
        image = Value(image),
        artist = Value(artist);
  static Insertable<TrackEntityData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? albumTitle,
    Expression<Uint8List>? music,
    Expression<Uint8List>? image,
    Expression<String>? artist,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (albumTitle != null) 'album_title': albumTitle,
      if (music != null) 'music': music,
      if (image != null) 'image': image,
      if (artist != null) 'artist': artist,
    });
  }

  TrackEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? albumTitle,
      Value<Uint8List>? music,
      Value<Uint8List>? image,
      Value<String>? artist}) {
    return TrackEntityCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      albumTitle: albumTitle ?? this.albumTitle,
      music: music ?? this.music,
      image: image ?? this.image,
      artist: artist ?? this.artist,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (albumTitle.present) {
      map['album_title'] = Variable<String>(albumTitle.value);
    }
    if (music.present) {
      map['music'] = Variable<Uint8List>(music.value);
    }
    if (image.present) {
      map['image'] = Variable<Uint8List>(image.value);
    }
    if (artist.present) {
      map['artist'] = Variable<String>(artist.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrackEntityCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('albumTitle: $albumTitle, ')
          ..write('music: $music, ')
          ..write('image: $image, ')
          ..write('artist: $artist')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TrackEntityTable trackEntity = $TrackEntityTable(this);
  late final TrackDao trackDao = TrackDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [trackEntity];
}
