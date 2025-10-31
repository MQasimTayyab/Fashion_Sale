import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AssetImages extends StatelessWidget {
  const AssetImages({
    super.key,
    this.imagepath = '',
    this.issvg = true,
    this.height,
    this.width,
    this.fit,
  });
  final String imagepath;
  final bool issvg;
  final double? height;
  final double? width;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    if (issvg) {
      return SvgPicture.asset(
        imagepath,
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
      );
    } else {
      return Image.asset(
        imagepath,
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
      );
    }
  }
}
