import 'package:ibuild_vendor/core/constant/app_assets.dart';

class HomeCarousel {
  final String name;
  final String assetPath;
  final String capacity;
  final String price;
  HomeCarousel({
    required this.name,
    required this.assetPath,
    required this.capacity,
    required this.price,
  });

  HomeCarousel copyWith({
    String? name,
    String? assetPath,
    String? capacity,
    String? price,
  }) {
    return HomeCarousel(
      name: name ?? this.name,
      assetPath: assetPath ?? this.assetPath,
      capacity: capacity ?? this.capacity,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'assetPath': assetPath,
      'capacity': capacity,
      'price': price,
    };
  }
}


List<HomeCarousel> carousels = [
  HomeCarousel(
    name: "Le Tourneau L-2350",
    assetPath: AppImages.l2350,
    capacity: "72 tons",
    price: "150.00/Day",
  ),
  HomeCarousel(
    name: "Liebherr R 9800",
    assetPath: AppImages.liebherr,
    capacity: "80 tons",
    price: "250.00/Day",
  ),
  HomeCarousel(
    name: "Caterpillar 797F",
    assetPath: AppImages.truck,
    capacity: "50 tons",
    price: "100.00/Day",
  ),
  HomeCarousel(
    name: "Bagger 293",
    assetPath: AppImages.bagger,
    capacity: "128 tons",
    price: "550.00/Day",
  ),
  HomeCarousel(
    name: "RH 400 Hydraulic Shovel",
    assetPath: AppImages.rh,
    capacity: "100 tons",
    price: "250.00/Day",
  )
];
