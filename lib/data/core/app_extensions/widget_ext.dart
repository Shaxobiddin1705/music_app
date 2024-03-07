import 'package:flutter/material.dart';
import 'package:music_app/app/design_system/styles/decoration/box_decorations.dart';

extension SliverAnimations on Widget {
  SliverLayoutBuilder addSliverAnimatedOpacityAndTransform({
    required double height,
  }) {
    return SliverLayoutBuilder(
      builder: (context, box) {
        late double opacity = (height - box.overlap) / height;
        if (box.overlap > height) opacity = 0.0;
        if (box.overlap <= 0.0) opacity = 1.0;
        return SliverOpacity(
          opacity: opacity,
          sliver: SliverToBoxAdapter(
            child: Transform(
              transform: Matrix4.identity()..scale(opacity, opacity),
              alignment: Alignment.center,
              child: this,
            ),
          ),
        );
      },
    );
  }

  Material onPress({
    required VoidCallback? onTap,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? defaultBorderRadius,
        child: Ink(
          padding: padding ?? EdgeInsets.zero,
          child: this,
        ),
      ),
    );
  }
}
