import 'package:flutter/cupertino.dart';
import 'package:music_app/app/app_bloc/app_bloc.dart';
import 'package:music_app/app/app_bloc/app_bloc_helper.dart';
import 'package:music_app/app/design_system/design_system.dart';
import 'package:music_app/app/feature/current_track/current_track_view.dart';
import 'package:music_app/app/navigation/src/navigation_utils.dart';
import 'package:music_app/data/core/core.dart';
import 'package:music_app/domain/model/main_album.dart';
import 'package:music_app/domain/model/search_album.dart';

part 'components/loaded_view.dart';

part 'components/loading_view.dart';

part 'components/album_bottom_sheet.dart';

@RoutePage()
class AlbumPlaylistPage extends StatefulWidget implements AutoRouteWrapper {
  final SearchAlbum searchAlbum;

  const AlbumPlaylistPage({super.key, required this.searchAlbum});

  @override
  State<AlbumPlaylistPage> createState() => _AlbumPlaylistPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBlocHelper.getAlbumBloc()
        ..add(FetchAlbumEvent(id: searchAlbum.album.id)),
      child: this,
    );
  }
}

class _AlbumPlaylistPageState extends State<AlbumPlaylistPage> {
  final ValueNotifier<int?> _downloadingFile = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            MySliverAppBar(title: Text(widget.searchAlbum.title)),
            BlocConsumer<AlbumBloc, AlbumState>(
              listener: (context, state) {
                if (state is AlbumLoaded) {
                  context
                      .read<PlaylistBloc>()
                      .add(ChangePlaylistEvent(tracks: state.mainAlbum.tracks));
                }
              },
              builder: (context, state) {
                if (state is AlbumLoading) {
                  return const _LoadingView();
                } else if (state is AlbumLoaded) {
                  return _LoadedView(state.mainAlbum, _downloadingFile);
                }
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
            ),
          ],
        ),
        bottomNavigationBar: const CurrentTrackView(),
      ),
    );
  }
}
