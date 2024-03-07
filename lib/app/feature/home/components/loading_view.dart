part of '../home_page.dart';

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return const DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.shimmerBaseColor,
                borderRadius: defaultBorderRadius,
              ),
              child: ShimmerView(
                child: SizedBox(height: 280, width: 240),
              ),
            );
          },
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
      ),
    );
  }
}
