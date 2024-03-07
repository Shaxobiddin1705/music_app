import 'package:music_app/domain/model/playlist_model.dart';

class SearchAlbum {
  final int id;
  final String title;
  final String titleShort;
  final int duration;
  final int rank;
  final String preview;
  final Artist artist;
  final Album album;
  final String type;

  SearchAlbum({
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
}

class Artist {
  final int id;
  final String name;
  final String link;
  final String pictureSmall;
  final String pictureMedium;
  final String pictureBig;
  final String pictureXl;
  final String tracklist;
  final String type;

  Artist({
    required this.id,
    required this.name,
    required this.link,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.tracklist,
    required this.type,
  });
}
