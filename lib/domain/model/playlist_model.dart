import 'package:equatable/equatable.dart';

class Playlist {
  final int id;
  final String title;
  final String description;
  final int duration;
  final String pictureSmall;
  final String pictureMedium;
  final String pictureBig;
  final String pictureXl;
  final String checksum;
  final String creationDate;
  final Tracks tracks;

  Playlist({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.checksum,
    required this.creationDate,
    required this.tracks,
  });
}

class Tracks {
  final List<Datum> data;

  Tracks({
    required this.data,
  });
}

class Datum {
  final int id;
  final String title;
  final String titleShort;
  final int duration;
  final int rank;
  final String preview;
  final Album album;

  Datum({
    required this.id,
    required this.title,
    required this.titleShort,
    required this.duration,
    required this.rank,
    required this.preview,
    required this.album,
  });
}

class Album extends Equatable {
  final int id;
  final String title;
  final String cover;
  final String coverSmall;
  final String coverMedium;
  final String coverBig;
  final String coverXl;

  const Album({
    required this.id,
    required this.title,
    required this.cover,
    required this.coverSmall,
    required this.coverMedium,
    required this.coverBig,
    required this.coverXl,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        cover,
        coverSmall,
        coverMedium,
        coverBig,
        coverXl,
      ];
}
