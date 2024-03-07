import 'package:flutter/material.dart';
import 'package:music_app/app/design_system/const/app_colors.dart';
import 'package:music_app/app/design_system/styles/decoration/box_decorations.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerView extends StatelessWidget {
  final Widget child;
  final bool forText;
  final bool isEnabled;

  const ShimmerView({
    super.key,
    required this.child,
    this.forText = false,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: isEnabled,
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerBaseColor.withOpacity(0.5),
      child: child,
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final Widget? child;
  final EdgeInsets? padding;

  const ShimmerContainer({
    super.key,
    this.height,
    this.width,
    this.child,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Colors.white,
        borderRadius: borderRadius ?? defaultBorderRadius,
      ),
      child: child,
    );
  }
}

class ShimmerWrapBox extends StatelessWidget {
  final Widget child;

  const ShimmerWrapBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
