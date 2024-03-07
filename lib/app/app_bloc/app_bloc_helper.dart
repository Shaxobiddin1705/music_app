import 'package:get_it/get_it.dart';
import 'package:music_app/app/app_bloc/app_bloc.dart';

mixin AppBlocHelper {
  static AlbumBloc getAlbumBloc() => GetIt.I.get<AlbumBloc>();

  static SearchAlbumCubit getSearchAlbumCubit() =>
      GetIt.I.get<SearchAlbumCubit>();

  static PlaylistBloc getPlaylistBloc() => GetIt.I.get<PlaylistBloc>();

  static LocalTracksBloc getLocalTracksBloc() => GetIt.I.get<LocalTracksBloc>();
}
