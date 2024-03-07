import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_app/app/design_system/styles/decoration/box_decorations.dart';

class NetworkImageX extends CachedNetworkImage {
  NetworkImageX({
    super.key,
    required super.imageUrl,
    super.alignment,
    super.color,
    super.colorBlendMode,
    super.errorListener,
    final BoxFit? fit,
    super.height,
    super.width,
    Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder,
    ColorFilter? colorFilter,
    BorderRadiusGeometry? borderRadius,
    Widget Function(BuildContext, String)? placeholder,
    Widget Function(BuildContext, String, Object)? errorWidget,
    super.progressIndicatorBuilder,
  }) : super(
          imageBuilder: imageBuilder ??
              (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: borderRadius ?? defaultBorderRadius,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: fit ?? BoxFit.cover,
                      colorFilter: colorFilter,
                    ),
                  ),
                );
              },
          placeholder: placeholder ??
              (context, url) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
          errorWidget:
              errorWidget ?? (context, url, error) => const Icon(Icons.error),
        );
}

class ImageX extends Image {
  ImageX.memory(
    super.bytes, {
    super.key,
    super.height,
    super.width,
    super.fit,
  }) : super.memory(
          frameBuilder: (context, child, _, __) {
            return Container(
              height: height ?? 56,
              width: width ?? 56,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.memory(bytes).image,
                  fit: fit ?? BoxFit.cover,
                ),
                borderRadius: borderRadius8,
              ),
            );
          },
        );
}
