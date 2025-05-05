
import 'dart:ui';

class SubcategoryModel {
  final String name;
  final String imageUrl;
  final double price;
  final int capacity;
  final bool isAvailable;
  final Color backgroundColor;

  SubcategoryModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.capacity,
    required this.isAvailable,
    required this.backgroundColor,
  });
}
