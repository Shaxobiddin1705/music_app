part of '../album_playlist_page.dart';

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverList.separated(
        itemCount: 12,
        itemBuilder: (context, index) {
          return const ShimmerView(
            child: Row(
              children: [
                ShimmerContainer(
                  borderRadius: borderRadius8,
                  height: 68,
                  width: 68,
                ),
                SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerWrapBox(
                      child: Text(
                        'Album Title Title ',
                        style: TextStyleX.styleF16W500,
                      ),
                    ),
                    SizedBox(height: 6),
                    ShimmerWrapBox(
                      child: Text(
                        'Album Title',
                        style: TextStyleX.styleF14W400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 12,
            indent: 100,
            endIndent: 24,
          );
        },
      ),
    );
  }
}
