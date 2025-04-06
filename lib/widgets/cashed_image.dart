import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CashedImage extends StatelessWidget {
  const CashedImage({
    super.key,
    required this.imgUrl,
    required this.radiosImg,
    this.imgWidth,
    this.imgHeight,
  });
  final String imgUrl;
  final double? imgWidth;
  final double? imgHeight;
  final double radiosImg;
  final BoxFit boxFit = BoxFit.cover;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radiosImg),
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          width: imgWidth ?? size.width * 0.18,
          height: imgHeight ?? size.height * 0.99,
          fit: boxFit,
        ),
      ),
    );
  }
}
