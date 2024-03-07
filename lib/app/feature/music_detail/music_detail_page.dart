import 'package:audio_service/audio_service.dart';
import 'package:music_app/app/design_system/design_system.dart';
import 'package:music_app/app/navigation/src/routing_utils.dart';
import 'package:music_app/data/core/core.dart';
import 'package:music_app/domain/model/main_album.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'components/inherited_widget.dart';

part 'components/buttons.dart';

part 'components/audio_progress_bar.dart';

part 'components/current_audio_title.dart';

@RoutePage()
class MusicDetailPage extends StatefulWidget {
  final Track? track;
  final List<Track> tracks;
  final SongModel? song;
  final List<SongModel> songs;

  const MusicDetailPage({
    super.key,
    required this.track,
    required this.tracks,
    this.song,
    required this.songs,
  });

  @override
  State<MusicDetailPage> createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  final _pageManager = GetIt.I.get<PageManager>();

  @override
  void initState() {
    _pageManager.init(widget.track, widget.tracks, widget.song, widget.songs);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MySliverAppBar(
            title: const Text('Now Playing'),
            actions: [
              IconButton(
                onPressed: () {
                  RoutingUtils.getMainNavigator().navigatePlaylist(context);
                },
                icon: const Icon(Icons.list),
              ),
              const SizedBox(width: 8),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: _MusicDetailInherit(
              pageManager: _pageManager,
              child: SliverList(
                delegate: SliverChildListDelegate([
                  const _AudioImage(),
                  const _CurrentSongTitle(),
                  const _AudioProgressBar(),
                  const _AudioControlButtons(),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AudioControlButtons extends StatelessWidget {
  const _AudioControlButtons();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _RepeatButton(),
          _PreviousSongButton(),
          _PlayButton(),
          _NextSongButton(),
          _ShuffleButton(),
        ],
      ),
    );
  }
}

class _AudioImage extends StatelessWidget {
  const _AudioImage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: StreamBuilder<MediaItem?>(
        stream: _MusicDetailInherit.of(context).pageManager.mediaItem,
        builder: (context, snapshot) {
          final image = snapshot.data?.extras?['image'];
          if (image != null) {
            return NetworkImageX(
              borderRadius: BorderRadius.circular(24),
              imageUrl: image,
              fit: BoxFit.fill,
              height: 320,
            );
          }
          return QueryArtworkWidget(
            id: int.tryParse(snapshot.data?.id ?? '') ?? 0,
            type: ArtworkType.AUDIO,
            artworkBorder: BorderRadius.circular(10),
            nullArtworkWidget: Container(
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.music_note_outlined,
              ),
            ),
          );
        },
      ),
    );
  }
}
