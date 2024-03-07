part of '../home_page.dart';

class _LoadedView extends StatelessWidget {
  final List<SearchAlbum> albums;

  const _LoadedView(this.albums);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final data = albums[index];
            return Stack(
              children: [
                NetworkImageX(
                  imageUrl: data.album.coverBig,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.colorBurn,
                  ),
                ).onPress(
                  onTap: () {
                    RoutingUtils.getMainNavigator()
                        .navigateAlbumPlaylist(context, data);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: defaultBorderRadius,
                        ),
                        child: Text(
                          data.album.title,
                          style: TextStyleX.styleF10W400.copyWith(
                            color: AppColors.textContrast,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data.title,
                        style: TextStyleX.styleF18W700.copyWith(
                          color: AppColors.textContrast,
                          height: 1.1,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            );
          },
          childCount: albums.length,
        ),
      ),
    );
  }
}
