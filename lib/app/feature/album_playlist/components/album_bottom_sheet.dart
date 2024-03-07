part of '../album_playlist_page.dart';

class _AlbumBottomSheet extends StatelessWidget {
  const _AlbumBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BottomSheetTopDivider(),
        _ListTile(
          title: 'Download music',
          onPressed: () {},
        ),
        _ListTile(
          title: 'Save music for offline mode',
          onPressed: () {},
        ),
      ],
    );
  }
}

class _ListTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const _ListTile({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: TextStyleX.styleF16W500),
          const Icon(
            CupertinoIcons.right_chevron,
            size: 22,
            color: AppColors.primaryColor,
          ),
        ],
      ).onPress(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        onTap: onPressed,
      ),
    );
  }
}
