import 'dart:ui';

import 'package:music_app/app/design_system/widgets/custom_flexible_space_bar.dart';
import 'package:music_app/app/design_system/design_system.dart';

class MySimpleSliverAppBar extends StatelessWidget {
  final String title;
  final bool centerTitle;
  final List<Widget>? actions;
  final double expandedTitleScale;
  final bool snap;
  final bool pinned;
  final bool floating;
  final Color foregroundColor;

  const MySimpleSliverAppBar({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.expandedTitleScale = 140,
    this.snap = false,
    this.pinned = true,
    this.floating = false,
    this.foregroundColor = AppColors.textPrimary,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: snap,
      pinned: pinned,
      floating: floating,
      foregroundColor: foregroundColor,
      leading: const AutoLeadingButton(),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: centerTitle,
        expandedTitleScale: expandedTitleScale,
      ),
      actions: [
        ...?actions,
        const SizedBox(width: 16),
      ],
    );
  }
}

class MySliverAppBar extends SliverAppBar {
  MySliverAppBar({
    super.key,
    super.title,
    super.pinned = true,
    super.elevation = 6,
    super.snap = true,
    super.floating = true,
    super.systemOverlayStyle,
    super.actions,
    super.leading,
    Color? backgroundColor,
    super.primary,
    super.bottom,
    super.expandedHeight,
    super.centerTitle = false,
    super.automaticallyImplyLeading,
    super.shadowColor,
    Widget? flexibleSpace,
  }) : super(
          backgroundColor: backgroundColor ?? AppColors.mainBackground,
          flexibleSpace: flexibleSpace ??
              FlexibleSpaceBar(
                background: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      color: backgroundColor ?? AppColors.mainBackground,
                    ),
                  ),
                ),
              ),
        );

  MySliverAppBar.flexibleSpace(
    BuildContext context, {
    super.key,
    super.pinned = true,
    super.elevation = 8,
    super.snap = true,
    super.floating = true,
    super.systemOverlayStyle,
    super.actions,
    String? title,
    double? expandedHeight,
    Color? backgroundColor,
    super.primary,
    super.bottom,
    super.centerTitle,
    super.automaticallyImplyLeading,
    super.shadowColor,
    bool withLeading = true,
  }) : super(
          backgroundColor: backgroundColor ?? AppColors.mainBackground,
          expandedHeight: expandedHeight ?? 139,
          flexibleSpace: CustomFlexibleSpaceBar(
            centerTitle: false,
            withLeading: withLeading,
            titlePadding: const EdgeInsets.only(left: 16, bottom: 11),
            title: title != null
                ? Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  )
                : null,
          ),
        );
}
