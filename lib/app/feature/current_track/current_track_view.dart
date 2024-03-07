import 'package:audio_service/audio_service.dart';
import 'package:music_app/app/design_system/design_system.dart';
import 'package:music_app/app/navigation/src/navigation_utils.dart';
import 'package:music_app/data/core/core.dart';
import 'package:on_audio_query/on_audio_query.dart';

class CurrentTrackView extends StatefulWidget {
  const CurrentTrackView({super.key});

  @override
  State<CurrentTrackView> createState() => _CurrentTrackViewState();
}

class _CurrentTrackViewState extends State<CurrentTrackView> {
  final pageManager = GetIt.I.get<PageManager>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationUtils.getMainNavigator()
            .navigateMusicDetail(context, [], null, null, []);
      },
      child: StreamBuilder<MediaItem?>(
        stream: pageManager.mediaItem,
        builder: (context, snapshot) {
          final mediaItem = snapshot.data;
          if (mediaItem == null) return const SizedBox.shrink();
          return Container(
            height: 64,
            padding: const EdgeInsets.fromLTRB(24, 4, 12, 4),
            color: AppColors.primaryColor.withOpacity(0.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (mediaItem.extras?['song'] == null &&
                    mediaItem.extras?['url'] == null)
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.music_note_outlined),
                    ),
                  ),
                if (mediaItem.extras?['url'] != null)
                  Expanded(
                    child: NetworkImageX(
                      borderRadius: BorderRadius.circular(8),
                      imageUrl: mediaItem.extras?['image'],
                      fit: BoxFit.cover,
                      height: 44,
                    ),
                  ),
                if (mediaItem.extras?['song'] != null)
                  Expanded(
                    child: QueryArtworkWidget(
                      id: int.parse(mediaItem.id),
                      type: ArtworkType.AUDIO,
                      artworkHeight: 44,
                      artworkFit: BoxFit.cover,
                      artworkBorder: BorderRadius.circular(8),
                      nullArtworkWidget: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.music_note_outlined),
                      ),
                    ),
                  ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        mediaItem.title,
                        style: TextStyleX.styleF16W500,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        mediaItem.artist ?? mediaItem.album ?? 'Unknown',
                        style: TextStyleX.styleF14W400,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder<bool>(
                    stream: pageManager.playingStream(),
                    builder: (context, snapshot) {
                      final isPlaying = snapshot.data ?? false;
                      return IconButton(
                        onPressed: () {
                          if (isPlaying) {
                            pageManager.pause();
                          } else if (!isPlaying) {
                            pageManager.play();
                          }
                        },
                        color: Colors.black,
                        padding: EdgeInsets.zero,
                        iconSize: 36,
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
