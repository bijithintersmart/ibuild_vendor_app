import 'package:flutter/material.dart';
import 'package:ibuild_vendor/features/equipments/data/models/subcategory_model.dart';

class CategoryModel {
  final String name;
  final String imageUrl;
  final double price;
  final int capacity;
  final bool isAvailable;
  final Color backgroundColor;
  final String category;
  final List<SubcategoryModel> subCategories;

  const CategoryModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.capacity,
    required this.isAvailable,
    required this.backgroundColor,
    required this.category,
    required this.subCategories,
  });
}
