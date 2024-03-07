import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

class MainAlbum {
  final int id;
  final String title;
  final String cover;
  final String coverSmall;
  final String coverMedium;
  final String coverBig;
  final String coverXl;
  final String label;
  final int duration;
  final int fans;
  final Artist artist;
  final DateTime releaseDate;
  final List<Track> tracks;

  MainAlbum({
    required this.id,
    required this.title,
    required this.cover,
    required this.coverSmall,
    required this.coverMedium,
    required this.coverBig,
    required this.coverXl,
    required this.label,
    required this.duration,
    required this.fans,
    required this.artist,
    required this.releaseDate,
    required this.tracks,
  });
}

class Artist {
  final int id;
  final String name;
  final String picture;
  final String pictureSmall;
  final String pictureMedium;
  final String pictureBig;
  final String pictureXL;

  Artist({
    required this.id,
    required this.name,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXL,
  });
}

class Track extends Equatable {
  final int id;
  final String title;
  final String albumTitle;
  final String? preview;
  final Uint8List? music;
  final String artist;
  final String? networkImage;
  final Uint8List? image;

  const Track({
    required this.id,
    required this.title,
    required this.albumTitle,
    this.preview,
    this.music,
    required this.artist,
    this.image,
    this.networkImage,
  });

  @override
  List<Object?> get props => [id, title];
}
