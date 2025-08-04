import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.borderRadius,
  });
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: _renderImage(),
    );
  }

  Widget _renderImage() {
    if (imageUrl.startsWith("http") || imageUrl.startsWith("www.")) {
      return Image.network(
        imageUrl,
        height: height,
        width: width,
        fit: fit,
        color: color,
      );
    } else if (!imageUrl.startsWith("http") && imageUrl.endsWith(".svg")) {
      return SvgPicture.asset(
        imageUrl,
        height: height,
        width: width,
        fit: fit ?? BoxFit.fitWidth,
        // ignore: deprecated_member_use
        color: color,
      );
    } else if (imageUrl.startsWith("http") && imageUrl.endsWith(".svg")) {
      return SvgPicture.network(
        imageUrl,
        height: height,
        width: width,
        fit: fit ?? BoxFit.fitWidth,
      );
    } else {
      return Image.asset(
        imageUrl,
        height: height,
        width: width,
        fit: fit,
        color: color,
      );
    }
  }
}
