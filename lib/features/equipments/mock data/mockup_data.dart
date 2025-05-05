import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/utils/app_utils/functions.dart';
import 'package:ibuild_vendor/features/equipments/data/models/category_model.dart';
import 'package:ibuild_vendor/features/equipments/data/models/subcategory_model.dart';

final List<CategoryModel> equipmentList = [
  CategoryModel(
    name: 'Mobile Cranes',
    imageUrl: 'assets/images/crane.png',
    price: 5000.00,
    capacity: 25,
    isAvailable: Random(1).nextInt(7) != getRandomInteger(1, max: 100),
    backgroundColor: Colors.blue.shade50,
    category: 'Mobile Cranes',
    subCategories: [
      'Mobile Crane 25 Ton',
      'Mobile Crane 50 Ton',
      'Mobile Crane 60 Ton',
      'Mobile Crane 80 Ton',
      'Mobile Crane 100 Ton',
      'Mobile Crane 120 Ton',
      'Mobile Crane 150 Ton',
      'Mobile Crane 180 Ton',
      'Mobile Crane 200 Ton',
      'Mobile Crane 220 Ton',
      'Mobile Crane 250 Ton',
      'Mobile Crane 280 Ton',
    ]
        .map((name) => SubcategoryModel(
              name: name,
              imageUrl: 'assets/images/crane.png',
              price: 5000.00,
              capacity: int.tryParse(
                      RegExp(r'(\d+)\s*Ton', caseSensitive: false)
                              .firstMatch(name)
                              ?.group(1) ??
                          "") ??
                  getRandomInteger(1, max: 100),
              isAvailable:
                  Random(1).nextInt(7) != getRandomInteger(1, max: 100),
              backgroundColor: Colors.blue.shade50,
            ))
        .toList(),
  ),
  CategoryModel(
    name: 'Tractors & Loaders',
    imageUrl: 'assets/images/tractor.webp',
    price: 1800.00,
    capacity: 5,
    isAvailable: Random(1).nextInt(7) != getRandomInteger(1, max: 100),
    backgroundColor: Colors.green.shade50,
    category: 'Tractors & Loaders',
    subCategories: [
      'Loader Tractor',
    ]
        .map((name) => SubcategoryModel(
              name: name,
              imageUrl: 'assets/images/tractor.webp',
              price: 1800.00,
              capacity: int.tryParse(
                      RegExp(r'(\d+)\s*Ton', caseSensitive: false)
                              .firstMatch(name)
                              ?.group(1) ??
                          "") ??
                  getRandomInteger(1, max: 100),
              isAvailable:
                  Random(1).nextInt(7) != getRandomInteger(1, max: 100),
              backgroundColor: Colors.green.shade50,
            ))
        .toList(),
  ),
  CategoryModel(
    name: 'Bobcats',
    imageUrl: 'assets/images/bobcat.png',
    price: 1100.00,
    capacity: 3,
    isAvailable: Random(1).nextInt(7) != getRandomInteger(1, max: 100),
    backgroundColor: Colors.deepOrange.shade50,
    category: 'Bobcats',
    subCategories: [
      'Bobcat',
    ]
        .map((name) => SubcategoryModel(
              name: name,
              imageUrl: 'assets/images/bobcat.png',
              price: 1100.00,
              capacity: int.tryParse(
                      RegExp(r'(\d+)\s*Ton', caseSensitive: false)
                              .firstMatch(name)
                              ?.group(1) ??
                          "") ??
                  getRandomInteger(1, max: 100),
              isAvailable:
                  Random(1).nextInt(7) != getRandomInteger(1, max: 100),
              backgroundColor: Colors.deepOrange.shade50,
            ))
        .toList(),
  ),
  CategoryModel(
    name: 'Forklifts',
    imageUrl: 'assets/images/forklift.png',
    price: 800.00,
    capacity: 5,
    isAvailable: Random(1).nextInt(7) != getRandomInteger(1, max: 100),
    backgroundColor: Colors.cyan.shade50,
    category: 'Forklifts',
    subCategories: [
      'Forklift',
    ]
        .map((name) => SubcategoryModel(
              name: name,
              imageUrl: 'assets/images/forklift.png',
              price: 800.00,
              capacity: int.tryParse(
                      RegExp(r'(\d+)\s*Ton', caseSensitive: false)
                              .firstMatch(name)
                              ?.group(1) ??
                          "") ??
                  getRandomInteger(1, max: 100),
              isAvailable:
                  Random(1).nextInt(7) != getRandomInteger(1, max: 100),
              backgroundColor: Colors.cyan.shade50,
            ))
        .toList(),
  ),
];
