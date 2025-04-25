import 'package:flutter/material.dart';
import 'package:ibuild_vendor/features/details/data/models/gallery_model.dart';
import 'package:ibuild_vendor/features/details/presentation/widgets/gallery_item.dart';

class GalleryGrid extends StatelessWidget {
  final List<GalleryItem> items;
  const GalleryGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    List<List<GalleryItem>> rows = [];
    List<GalleryItem> currentRow = [];
    for (var item in items) {
      if (item.isFullWidth) {
        if (currentRow.isNotEmpty) {
          rows.add(List.from(currentRow));
          currentRow.clear();
        }
        rows.add([item]);
      } else {
        currentRow.add(item);
        if (currentRow.length == 2) {
          rows.add(List.from(currentRow));
          currentRow.clear();
        }
      }
    }
    if (currentRow.isNotEmpty) {
      rows.add(List.from(currentRow));
    }
    return Column(
        children: List.generate(
      rows.length,
      (index) {
        List<GalleryItem> rowItems = rows[index];
        if (rowItems.length == 1 && rowItems[0].isFullWidth) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: GalleryItemWidget(item: rowItems[0]),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: rowItems.map((item) {
              return Flexible(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: rowItems.indexOf(item) == 0 ? 4 : 0,
                    left: rowItems.indexOf(item) == 1 ? 4 : 0,
                  ),
                  child: GalleryItemWidget(item: item),
                ),
              );
            }).toList(),
          ),
        );
      },
    ));
  }
}
