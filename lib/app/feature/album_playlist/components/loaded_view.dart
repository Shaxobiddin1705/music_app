part of '../album_playlist_page.dart';

class _LoadedView extends StatelessWidget {
  final MainAlbum album;
  final ValueNotifier<int?> downloadingFile;

  const _LoadedView(this.album, this.downloadingFile);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AlbumBloc, AlbumState>(
      listener: (context, state) {
        if (state is AlbumLoaded) {
          if (!state.isDownloading) {
            downloadingFile.value = null;
          }
        }
      },
      child: SliverList.separated(
        itemCount: album.tracks.length,
        itemBuilder: (context, index) {
          final track = album.tracks[index];
          return ListTile(
            contentPadding: const EdgeInsets.only(left: 24, right: 12),
            onTap: () {
              NavigationUtils.getMainNavigator()
                  .navigateMusicDetail(context, album.tracks, track, null, []);
            },
            leading: NetworkImageX(
              imageUrl: album.coverMedium,
              borderRadius: borderRadius8,
              width: 60,
              fit: BoxFit.scaleDown,
            ),
            title: Text(track.title),
            subtitle: Text(album.artist.name),
            trailing: ValueListenableBuilder(
              valueListenable: downloadingFile,
              builder: (context, id, child) {
                return IconButton(
                  onPressed: () {
                    downloadingFile.value = track.id;
                    context.read<AlbumBloc>().add(DownloadFileEvent(track));
                  },
                  icon: id == track.id
                      ? const CircularProgressIndicator.adaptive()
                      : const Icon(Icons.file_download_outlined),
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 8,
            indent: 100,
            endIndent: 24,
          );
        },
      ),
    );
  }
}
