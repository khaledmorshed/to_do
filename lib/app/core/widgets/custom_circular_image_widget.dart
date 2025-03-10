import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCircularImageWidget extends StatelessWidget {
  final double height;
  final double width;
  final bool isCacheNetworkImage;
  String cacheImageUrl;
  String progressIndicatorImage;
  String errorImageWidget;

  CustomCircularImageWidget({
    this.height = 70,
    this.width = 70,
    this.isCacheNetworkImage = true,
    this.cacheImageUrl = "",
    this.progressIndicatorImage = "",
    this.errorImageWidget = "",
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height/0.6),
        child: isCacheNetworkImage ? CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: cacheImageUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) => Image.asset(progressIndicatorImage, fit: BoxFit.fill,),
          errorWidget: (context, url, error) => Image.asset(errorImageWidget, fit: BoxFit.fill,),
        ) : Image.asset("assets/images/flutter.png"),
      ),
    );
  }
}
