import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';
import 'package:image_picker/image_picker.dart';

class PhotoUploader extends StatefulWidget {
  const PhotoUploader({super.key});

  @override
  State<PhotoUploader> createState() => _PhotoUploaderState();
}

class _PhotoUploaderState extends State<PhotoUploader> {
  List<XFile> selectedImages = [];

  Future<void> _pickImage() async {
    List<XFile> pickedFile = await ImagePicker().pickMultiImage();
    if (pickedFile.isNotEmpty) {
      setState(() {
        selectedImages.addAll(pickedFile);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      selectedImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upload Photos',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.black,
                  fontSize: 12,
                ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.greyLight,
                border: Border.all(
                  color: AppColors.borderGrey,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: selectedImages.isEmpty
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NormalText(
                          text: "Select photos",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.grey),
                        ),
                        const Icon(Icons.upload_rounded)
                      ],
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        height: 30,
                        child: Row(
                            children: List.generate(
                          selectedImages.length,
                          (i) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: AppColors.secondary.withOpacity(.25),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.image, size: 20),
                                const SizedBox(width: 4),
                                Text(
                                  selectedImages[i].name,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () => _removeImage(i),
                                  child: const Icon(Icons.close, size: 16),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
