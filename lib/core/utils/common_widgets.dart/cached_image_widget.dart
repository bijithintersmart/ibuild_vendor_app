// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/loading.dart';

class CachedImageWidget extends StatelessWidget {
  final String imageUrl;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, Object)? errorWidget;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BlendMode? colorBlendMode;
  final Color? color;
  final String? cacheKey;
  final BoxShape shape;
  const CachedImageWidget({
    super.key,
    required this.imageUrl,
    this.placeholder,
    this.errorWidget,
    this.imageBuilder,
    this.width,
    this.shape = BoxShape.rectangle,
    this.height,
    this.fit,
    this.colorBlendMode,
    this.color,
    this.cacheKey,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      imageUrl: imageUrl,
      color: color,
      cacheKey: cacheKey,
      colorBlendMode: colorBlendMode,
      imageBuilder: imageBuilder ??
          (context, imageProvider) => Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: shape,
                    color: AppColors.primary,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: fit,
                    )),
              ),
      placeholder: placeholder ??
          (context, url) => Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  shape: shape,
                  color: AppColors.primary,
                ),
                child: const AppImageLoader(),
              ),
      errorWidget: errorWidget ??
          (context, url, error) => Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  shape: shape,
                  color: AppColors.primary,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.error_outline,
                  color: AppColors.black,
                ),
              ),
    );
  }
}
