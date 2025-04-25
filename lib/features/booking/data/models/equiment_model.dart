// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import '../../../../core/constant/app_assets.dart';

enum BookingStatus {
  pending,
  waitingApproval,
  confirmed,
  completed,
}

class EquipmentBooking {
  final String id;
  final String name;
  final String type;
  final String capacity;
  final DateTime bookingDate;
  final DateTime? serviceDate;
  final double pricePerDay;
  final int days;
  final double? totalPrice;
  final String imageUrl;
  final BookingStatus status;
  final String? assignedTo;
  EquipmentBooking({
    required this.id,
    required this.name,
    required this.type,
    required this.capacity,
    required this.bookingDate,
    this.serviceDate,
    required this.pricePerDay,
    required this.days,
    this.totalPrice,
    required this.imageUrl,
    required this.status,
    this.assignedTo,
  });
}

final List<EquipmentBooking> pendingBookings = [
  EquipmentBooking(
    id: "${Random().nextInt(1000)}",
    days: Random().nextInt(10),
    name: 'JCB',
    type: 'Earthmoving Equipment',
    capacity: '20 tons',
    bookingDate: DateTime(2025, 4, 23),
    pricePerDay: 500.00,
    imageUrl: AppImages.bagger,
    status: BookingStatus.pending,
  ),
  EquipmentBooking(
    name: 'JCB',
    id: "${Random().nextInt(1000)}",
    days: Random().nextInt(10),
    type: 'Earthmoving Equipment',
    capacity: '20 tons',
    bookingDate: DateTime(2025, 4, 19),
    pricePerDay: 500.00,
    imageUrl: AppImages.bagger,
    status: BookingStatus.waitingApproval,
  ),
  EquipmentBooking(
    id: "${Random().nextInt(1000)}",
    days: Random().nextInt(10),
    name: 'JCB',
    type: 'Earthmoving Equipment',
    capacity: '15 tons',
    bookingDate: DateTime(2025, 4, 28),
    pricePerDay: 500.00,
    imageUrl: AppImages.bagger,
    status: BookingStatus.waitingApproval,
  ),
];

final List<EquipmentBooking> completedBooking = [
  EquipmentBooking(
    id: '4',
    name: 'Concrete Truck',
    type: 'Earthmoving Equipment',
    capacity: '20 tons',
    bookingDate: DateTime(2024, 5, 3),
    serviceDate: DateTime(2024, 5, 3),
    pricePerDay: 250.00,
    days: 2,
    totalPrice: 500.00,
    imageUrl:  AppImages.bagger,
    status: BookingStatus.completed,
    assignedTo: 'John George',
  ),
  EquipmentBooking(
    id: '5',
    name: 'Concrete Truck',
    type: 'Earthmoving Equipment',
    capacity: '20 tons',
    bookingDate: DateTime(2024, 5, 3),
    serviceDate: DateTime(2024, 5, 3),
    pricePerDay: 250.00,
    days: 2,
    totalPrice: 500.00,
    imageUrl:  AppImages.bagger,
    status: BookingStatus.completed,
    assignedTo: 'John George',
  ),
  EquipmentBooking(
    id: '6',
    name: 'Concrete Truck',
    type: 'Earthmoving Equipment',
    capacity: '20 tons',
    bookingDate: DateTime(2024, 5, 3),
    serviceDate: DateTime(2024, 5, 3),
    pricePerDay: 250.00,
    days: 2,
    totalPrice: 500.00,
    imageUrl: AppImages.bagger,
    status: BookingStatus.completed,
    assignedTo: 'John George',
  ),
];
final List<EquipmentBooking> confirmBooking = [
  EquipmentBooking(
    id: '1',
    name: 'Concrete Truck',
    type: 'Earthmoving Equipment',
    capacity: '20 tons',
    bookingDate: DateTime(2024, 5, 3),
    serviceDate: DateTime(2024, 5, 3),
    pricePerDay: 250.00,
    days: 2,
    totalPrice: 500.00,
    imageUrl:  AppImages.bagger,
    status: BookingStatus.confirmed,
    assignedTo: 'John George',
  ),
  EquipmentBooking(
    id: '2',
    name: 'Concrete Truck',
    type: 'Earthmoving Equipment',
    capacity: '20 tons',
    bookingDate: DateTime(2024, 5, 3),
    serviceDate: DateTime(2024, 5, 3),
    pricePerDay: 250.00,
    days: 2,
    totalPrice: 500.00,
    imageUrl:  AppImages.bagger,
    status: BookingStatus.confirmed,
    assignedTo: 'John George',
  ),
  EquipmentBooking(
    id: '3',
    name: 'Concrete Truck',
    type: 'Earthmoving Equipment',
    capacity: '20 tons',
    bookingDate: DateTime(2024, 5, 3),
    serviceDate: DateTime(2024, 5, 3),
    pricePerDay: 250.00,
    days: 1,
    totalPrice: 500.00,
    imageUrl:  AppImages.bagger,
    status: BookingStatus.confirmed,
    assignedTo: 'John George',
  ),
];
