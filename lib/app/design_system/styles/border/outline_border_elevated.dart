import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/foundation.dart' show clampDouble;
import 'package:flutter/material.dart';

class OutlineInputBorderElevated extends OutlineInputBorder {
  const OutlineInputBorderElevated({
    super.borderSide = const BorderSide(),
    super.borderRadius,
    super.gapPadding = 4,
    required this.boxShadow,
    this.backgroundColor,
  });

  static bool _cornersAreCircular(BorderRadius borderRadius) {
    return borderRadius.topLeft.x == borderRadius.topLeft.y &&
        borderRadius.bottomLeft.x == borderRadius.bottomLeft.y &&
        borderRadius.topRight.x == borderRadius.topRight.y &&
        borderRadius.bottomRight.x == borderRadius.bottomRight.y;
  }

  final BoxShadow boxShadow;
  final Color? backgroundColor;

  Path _gapBorderPath(
    Canvas canvas,
    RRect center,
    double start,
    double extent,
  ) {
    // When the corner radii on any side add up to be greater than the
    // given height, each radius has to be scaled to not exceed the
    // size of the width/height of the RRect.
    final RRect scaledRRect = center.scaleRadii();

    final Rect tlCorner = Rect.fromLTWH(
      scaledRRect.left,
      scaledRRect.top,
      scaledRRect.tlRadiusX * 2.0,
      scaledRRect.tlRadiusY * 2.0,
    );
    final Rect trCorner = Rect.fromLTWH(
      scaledRRect.right - scaledRRect.trRadiusX * 2.0,
      scaledRRect.top,
      scaledRRect.trRadiusX * 2.0,
      scaledRRect.trRadiusY * 2.0,
    );
    final Rect brCorner = Rect.fromLTWH(
      scaledRRect.right - scaledRRect.brRadiusX * 2.0,
      scaledRRect.bottom - scaledRRect.brRadiusY * 2.0,
      scaledRRect.brRadiusX * 2.0,
      scaledRRect.brRadiusY * 2.0,
    );
    final Rect blCorner = Rect.fromLTWH(
      scaledRRect.left,
      scaledRRect.bottom - scaledRRect.blRadiusY * 2.0,
      scaledRRect.blRadiusX * 2.0,
      scaledRRect.blRadiusX * 2.0,
    );

    // This assumes that the radius is circular (x and y radius are equal).
    // Currently, BorderRadius only supports circular radii.
    const double cornerArcSweep = math.pi / 2.0;
    final double tlCornerArcSweep = math.acos(
      clampDouble(1 - start / scaledRRect.tlRadiusX, 0.0, 1.0),
    );

    final Path path = Path()..addArc(tlCorner, math.pi, tlCornerArcSweep);

    if (start > scaledRRect.tlRadiusX) {
      path.lineTo(scaledRRect.left + start, scaledRRect.top);
    }

    const double trCornerArcStart = (3 * math.pi) / 2.0;
    const double trCornerArcSweep = cornerArcSweep;
    if (start + extent < scaledRRect.width - scaledRRect.trRadiusX) {
      path.moveTo(scaledRRect.left + start + extent, scaledRRect.top);
      path.lineTo(scaledRRect.right - scaledRRect.trRadiusX, scaledRRect.top);
      path.addArc(trCorner, trCornerArcStart, trCornerArcSweep);
    } else if (start + extent < scaledRRect.width) {
      final double dx = scaledRRect.width - (start + extent);
      final double sweep = math.asin(
        clampDouble(1 - dx / scaledRRect.trRadiusX, 0.0, 1.0),
      );
      path.addArc(trCorner, trCornerArcStart + sweep, trCornerArcSweep - sweep);
    }

    return path
      ..moveTo(scaledRRect.right, scaledRRect.top + scaledRRect.trRadiusY)
      ..lineTo(scaledRRect.right, scaledRRect.bottom - scaledRRect.brRadiusY)
      ..addArc(brCorner, 0.0, cornerArcSweep)
      ..lineTo(scaledRRect.left + scaledRRect.blRadiusX, scaledRRect.bottom)
      ..addArc(blCorner, math.pi / 2.0, cornerArcSweep)
      ..lineTo(scaledRRect.left, scaledRRect.top + scaledRRect.tlRadiusY);
  }

  void _paintBox(
    Canvas canvas,
    Rect rect,
    Paint paint,
    TextDirection? textDirection,
  ) {
    canvas.drawRRect(
      borderRadius.resolve(textDirection).toRRect(rect),
      paint,
    );
  }

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    assert(gapPercentage >= 0.0 && gapPercentage <= 1.0);
    assert(_cornersAreCircular(borderRadius));

    final Paint paint = borderSide.toPaint();
    final RRect outer = borderRadius.toRRect(rect);
    final RRect center = outer.deflate(borderSide.width / 2.0);
    if (gapStart == null || gapExtent <= 0.0 || gapPercentage == 0.0) {
      final shadowPaint = Paint();
      shadowPaint
        ..strokeWidth = 0
        ..color = Colors.transparent
        ..style = PaintingStyle.fill;
      canvas.drawRRect(center, shadowPaint);

      canvas.drawRRect(center, paint);
    } else {
      final double extent =
          lerpDouble(0.0, gapExtent + gapPadding * 2.0, gapPercentage)!;
      switch (textDirection!) {
        case TextDirection.rtl:
          final Path path = _gapBorderPath(
            canvas,
            center,
            math.max(0.0, gapStart + gapPadding - extent),
            extent,
          );
          canvas.drawPath(path, paint);
          break;

        case TextDirection.ltr:
          final Path path = _gapBorderPath(
            canvas,
            center,
            math.max(0.0, gapStart - gapPadding),
            extent,
          );
          canvas.drawPath(path, paint);
          break;
      }
    }
  }
}
