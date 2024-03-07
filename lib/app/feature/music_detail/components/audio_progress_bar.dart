part of '../music_detail_page.dart';

class _AudioProgressBar extends StatelessWidget {
  const _AudioProgressBar();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable:
          _MusicDetailInherit.of(context).pageManager.progressNotifier,
      builder: (_, value, __) {
        return ProgressBar(
          progress: value.current,
          buffered: value.buffered,
          total: value.total,
          onSeek: _MusicDetailInherit.of(context).pageManager.seek,
        );
      },
    );
  }
}
