import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

class TractImage {
  TractImage._();

  static Widget network(String imageUrl,
      {double? width, Color? color, double? height}) {
    final AssetType type = AssetType.fromExtension(imageUrl);
    switch (type) {
      case AssetType.svg:
        return SvgPicture.network(
          imageUrl,
          width: width,
          height: height,
          colorFilter:
              color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        );
      case AssetType.vec:
        return SvgPicture(
          NetworkBytesLoader(Uri.parse(imageUrl)),
          width: width,
          height: height,
          colorFilter:
              color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        );
      default:
        return Image.network(
          imageUrl,
          color: color,
          width: width,
          height: height,
        );
    }
  }

  static Widget asset(String imageLocation,
      {double? width, Color? color, double? height}) {
    final AssetType type = AssetType.fromExtension(imageLocation);
    switch (type) {
      case AssetType.svg:
        return SvgPicture.asset(
          imageLocation,
          width: width,
          height: height,
          colorFilter:
              color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        );
      case AssetType.vec:
        return SvgPicture(
          AssetBytesLoader(imageLocation),
          width: width,
          height: height,
          colorFilter:
              color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        );
      default:
        return Image.asset(
          imageLocation,
          color: color,
          height: height,
          width: width,
        );
    }
  }
}

enum AssetType {
  vec,
  image,
  svg;

  factory AssetType.fromExtension(String extension) {
    if (extension.endsWith('svg')) {
      return AssetType.svg;
    } else if (extension.endsWith('vec')) {
      return AssetType.vec;
    } else {
      return AssetType.image;
    }
  }
}
