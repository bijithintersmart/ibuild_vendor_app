import 'package:ibuild_vendor/core/constant/app_assets.dart';

enum GalleryItemType { image, video }

class GalleryItem {
  final GalleryItemType type;
  final String path;
  final String? thumbnailPath;
  final bool isFullWidth;

  GalleryItem({
    required this.type,
    required this.path,
    this.thumbnailPath,
    required this.isFullWidth,
  });
}

final List<GalleryItem> galleryItems = [
  GalleryItem(
    type: GalleryItemType.image,
    path: AppImages.l2350,
    isFullWidth: false,
  ),
  GalleryItem(
    type: GalleryItemType.image,
    path: AppImages.l2350,
    isFullWidth: false,
  ),
  GalleryItem(
    type: GalleryItemType.video,
    path: 'assets/video/truck.mp4',
    thumbnailPath: 'assets/cement_mixer_thumb.png',
    isFullWidth: true,
  ),
  GalleryItem(
    type: GalleryItemType.image,
    path: AppImages.l2350,
    isFullWidth: false,
  ),
  GalleryItem(
    type: GalleryItemType.image,
    path: AppImages.l2350,
    isFullWidth: false,
  ),
];
