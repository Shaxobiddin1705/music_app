import 'package:music_app/app/app_bloc/src/bloc/playlist/playlist_bloc.dart';
import 'package:music_app/app/design_system/design_system.dart';
import 'package:music_app/domain/model/main_album.dart';

@RoutePage()
class PlaylistPage extends StatefulWidget {
  const PlaylistPage({super.key});

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MySliverAppBar(title: const Text('Playlist  ->  Now playing')),
          BlocBuilder<PlaylistBloc, PlaylistState>(
            builder: (context, state) {
              if (state is PlaylistReordered) {
                List<Track> playlist = state.tracks;
                return SliverPadding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  sliver: SliverReorderableList(
                    itemCount: playlist.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        key: Key('${playlist[index].id}'),
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Material(
                          color: Colors.transparent,
                          child: ListTile(
                            leading: playlist[index].networkImage != null
                                ? NetworkImageX(
                                    imageUrl: playlist[index].networkImage!,
                                    height: 56,
                                    width: 56,
                                    borderRadius: borderRadius8,
                                  )
                                : ImageX.memory(playlist[index].image!),
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              playlist[index].title,
                              style: TextStyleX.styleF16W500,
                            ),
                            subtitle: Text(playlist[index].albumTitle),
                            trailing: ReorderableDelayedDragStartListener(
                              index: index,
                              key: Key('${playlist[index].id}'),
                              child: const Icon(Icons.format_line_spacing),
                            ),
                          ),
                        ),
                      );
                    },
                    onReorder: (int oldIndex, int newIndex) {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }

                      final item = playlist.removeAt(oldIndex);
                      playlist.insert(newIndex, item);
                      context.read<PlaylistBloc>().add(
                            ChangePlaylistEvent(
                              tracks: playlist,
                              newIndex: newIndex,
                              oldIndex: oldIndex,
                            ),
                          );
                    },
                  ),
                );
              }
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            },
          ),
        ],
      ),
    );
  }
}
