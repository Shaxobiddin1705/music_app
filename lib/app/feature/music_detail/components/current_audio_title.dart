part of '../music_detail_page.dart';

class _CurrentSongTitle extends StatelessWidget {
  const _CurrentSongTitle();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable:
          _MusicDetailInherit.of(context).pageManager.currentSongTitleNotifier,
      builder: (_, title, __) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(title, style: TextStyleX.styleF18W700),
        );
      },
    );
  }
}
