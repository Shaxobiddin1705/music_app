import 'package:music_app/app/app_bloc/app_bloc.dart';
import 'package:music_app/app/design_system/design_system.dart';
import 'package:music_app/app/navigation/src/navigation_utils.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../current_track/current_track_view.dart';

@RoutePage()
class LocalTracksPage extends StatefulWidget {
  const LocalTracksPage({super.key});

  @override
  State<LocalTracksPage> createState() => _LocalTracksPageState();
}

class _LocalTracksPageState extends State<LocalTracksPage> {
  @override
  void initState() {
    context.read<LocalTracksBloc>().add(const LocalTracksEvent.getTracks());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            MySliverAppBar(title: const Text('Downloaded Playlist')),
            BlocBuilder<LocalTracksBloc, LocalTracksState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (songs) {
                    return SliverList.separated(
                      itemCount: songs.length,
                      itemBuilder: (context, index) {
                        final song = songs[index];
                        return _ListTile(
                          song: song,
                          onPressed: () {
                            NavigationUtils.getMainNavigator()
                                .navigateMusicDetail(
                                    context, [], null, song, songs);
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 4,
                          indent: 90,
                          endIndent: 24,
                        );
                      },
                    );
                  },
                  orElse: () => const SliverToBoxAdapter(
                    child: SizedBox.shrink(),
                  ),
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: const CurrentTrackView(),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  final SongModel song;
  final VoidCallback onPressed;

  const _ListTile({required this.song, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 24, right: 12),
      onTap: onPressed,
      leading: QueryArtworkWidget(
        id: song.albumId ?? 0,
        type: ArtworkType.ALBUM,
        artworkBorder: BorderRadius.circular(10),
        nullArtworkWidget: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: const Icon(
            Icons.music_note_outlined,
          ),
        ),
      ),
      title: Text(
        song.title,
        style: TextStyleX.styleF16W500.copyWith(height: 1.2),
      ),
      subtitle: Text(song.artist ?? 'Unknown'),
      trailing: const Icon(
        Icons.chevron_right_outlined,
        color: AppColors.primaryColor,
      ),
    );
  }
}
