import 'dart:ui';

import 'package:ibuild_vendor/core/constant/app_assets.dart';


class Equipment {
  final String name;
  final String imageUrl;
  final double price;
  final int capacity;
  final bool isAvailable;
  final Color backgroundColor;

  Equipment({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.capacity,
    required this.isAvailable,
    required this.backgroundColor,
  });
}

final List<Equipment> equipments = [
  Equipment(
    name: 'Excavators',
    imageUrl: AppImages.truck,
    price: 120.00,
    capacity: 20,
    isAvailable: true,
    backgroundColor: const Color(0xFFF5F0E5),
  ),
  Equipment(
    name: 'Articulated dump trucks',
    imageUrl: AppImages.l2350,
    price: 120.00,
    capacity: 20,
    isAvailable: true,
    backgroundColor: const Color(0xFFFABE67),
  ),
  Equipment(
    name: 'Wheel loaders',
    imageUrl: AppImages.liebherr,
    price: 120.00,
    capacity: 20,
    isAvailable: true,
    backgroundColor: const Color(0xFFF5F0E5),
  ),
  Equipment(
    name: 'Bulldozers',
    imageUrl: AppImages.rh,
    price: 120.00,
    capacity: 20,
    isAvailable: false,
    backgroundColor: const Color(0xFFFABE67),
  ),
  Equipment(
    name: 'Concrete Truck',
    imageUrl: AppImages.bagger,
    price: 120.00,
    capacity: 20,
    isAvailable: true,
    backgroundColor: const Color(0xFFF5F0E5),
  ),
  Equipment(
    name: 'Forklift',
    imageUrl: AppImages.l2350,
    price: 120.00,
    capacity: 20,
    isAvailable: true,
    backgroundColor: const Color(0xFFFABE67),
  ),
  Equipment(
    name: 'Dump Truck',
    imageUrl: AppImages.liebherr,
    price: 120.00,
    capacity: 20,
    isAvailable: true,
    backgroundColor: const Color(0xFFF5F0E5),
  ),
];
