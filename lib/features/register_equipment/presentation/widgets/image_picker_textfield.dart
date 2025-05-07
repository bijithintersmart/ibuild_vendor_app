import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';
import 'package:image_picker/image_picker.dart';
class PhotoUploader extends FormField<List<XFile>> {
  PhotoUploader({
    super.key,
    super.onSaved,
    super.validator,
    List<XFile>? initialValue,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
  }) : super(
          initialValue: initialValue ?? [],
          builder: (FormFieldState<List<XFile>> state) {
            return _PhotoUploaderField(state: state);
          },
        );
}

class _PhotoUploaderField extends StatefulWidget {
  final FormFieldState<List<XFile>> state;
  const _PhotoUploaderField({required this.state});

  @override
  State<_PhotoUploaderField> createState() => _PhotoUploaderFieldState();
}

class _PhotoUploaderFieldState extends State<_PhotoUploaderField> {
  List<XFile> get selectedImages => widget.state.value!;

  Future<void> _pickImage() async {
    List<XFile> pickedFiles = await ImagePicker().pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      setState(() {
        selectedImages.addAll(pickedFiles);
      });
      widget.state.didChange(selectedImages);
    }
  }

  void _removeImage(int index) {
    setState(() {
      selectedImages.removeAt(index);
    });
    widget.state.didChange(selectedImages);
  }

  @override
  Widget build(BuildContext context) {
    final showError = widget.state.hasError;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload Photos',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.black,
                fontSize: 12,
              ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            width: double.maxFinite,
            constraints:
                const BoxConstraints(minHeight: 40, maxHeight: 40 + 30),
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: AppColors.greyLight,
              border: Border.all(
                width: showError ? 2 : 1,
                color: showError ? Colors.red : AppColors.borderGrey,
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
                : Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: List.generate(
                      selectedImages.length,
                      (i) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.secondary.withOpacity(.25),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.image, size: 20),
                            const SizedBox(width: 4),
                            Text(
                              selectedImages[i].name,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(width: 2),
                            GestureDetector(
                              onTap: () => _removeImage(i),
                              child: const Icon(Icons.close, size: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        if (showError)
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 6),
            child: Text(
              widget.state.errorText ?? '',
              style: TextStyle(color: Colors.red[700], fontSize: 12),
            ),
          ),
      ],
    );
  }
}
