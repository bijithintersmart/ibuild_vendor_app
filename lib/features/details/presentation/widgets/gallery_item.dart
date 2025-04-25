import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/constant/app_assets.dart';
import 'package:ibuild_vendor/features/details/data/models/gallery_model.dart';
import 'package:video_player/video_player.dart';

class GalleryItemWidget extends StatefulWidget {
  final GalleryItem item;

  const GalleryItemWidget({super.key, required this.item});

  @override
  State<GalleryItemWidget> createState() => _GalleryItemWidgetState();
}
class _GalleryItemWidgetState extends State<GalleryItemWidget> {
  late final VideoPlayerController? _videoController;
  late final Future<void>? _initializeVideoFuture;

  @override
  void initState() {
    super.initState();
    if (widget.item.type == GalleryItemType.video) {
      _videoController = VideoPlayerController.asset(widget.item.path);
      _initializeVideoFuture = _videoController!.initialize();
    } else {
      _videoController = null;
      _initializeVideoFuture = null;
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.item.isFullWidth ? 16 / 9 : 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange[100],
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (widget.item.type == GalleryItemType.image)
              Image.asset(widget.item.path, fit: BoxFit.cover),
            if (widget.item.type == GalleryItemType.video)
              FutureBuilder(
                future: _initializeVideoFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return VideoPlayer(_videoController!);
                  } else {
                    return Image.asset(AppImages.liebherr, fit: BoxFit.cover);
                  }
                },
              ),
            if (widget.item.type == GalleryItemType.video)
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 24,
                  child: IconButton(
                    icon: Icon(
                      _videoController?.value.isPlaying ?? false
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.orange,
                      size: 30,
                    ),
                    onPressed: () {
                      if (_videoController?.value.isInitialized ?? false) {
                        setState(() {
                          if (_videoController!.value.isPlaying) {
                            _videoController.pause();
                          } else {
                            _videoController.play();
                          }
                        });
                      }
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
