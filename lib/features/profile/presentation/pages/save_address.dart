import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:ibuild_vendor/core/utils/services/location_services.dart';
import 'package:ibuild_vendor/core/utils/app_utils/app_logger.dart';
import 'package:latlong2/latlong.dart';

import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/features/profile/presentation/widgets/map_widget.dart';
import 'package:ibuild_vendor/features/profile/presentation/widgets/address_bottom_sheet.dart';

class SaveAddressScreen extends StatefulWidget {
  const SaveAddressScreen({super.key});

  @override
  State<SaveAddressScreen> createState() => _SaveAddressScreenState();
}

class _SaveAddressScreenState extends State<SaveAddressScreen> {
  @override
  void initState() {
    super.initState();
  }

  String formatAddress(String input) {
    final parts = input
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
    return parts.join(', ');
  }

  final MapController _mapController = MapController();
  final initialLocation = const LatLng(25.078377, 55.212439);
  final widgetKey = GlobalKey<MapControllerPageState>();
  String currentLocation = '';
  String currentAddress = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            if (GoRouter.of(context).canPop()) {
              GoRouter.of(context).pop();
            }
          },
        ),
        centerTitle: true,
        title: Text(
          'Confirm delivery location',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: Stack(
        children: [
          MapControllerPage(
            onLoctionSave: (place) {
              setState(() {
                String? clean(String? value) =>
                    (value != null && value.trim().isNotEmpty)
                        ? value.trim()
                        : null;
                final parts = [
                  clean(place.name),
                  clean(place.subLocality),
                  clean(place.locality),
                  clean(place.administrativeArea),
                ].whereType<String>().toList();
                currentAddress = parts.join(', ');
                currentLocation = clean(place.locality) ??
                    clean(place.subLocality) ??
                    clean(place.name) ??
                    'Unknown location';
                AppLogger.logInfo(currentAddress);
                AppLogger.logInfo(currentLocation);
              });
            },
            key: widgetKey,
            mapController: _mapController,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              alignment: Alignment.center,
              height: 45,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for area, street name..',
                  hintStyle: TextStyle(
                    color: AppColors.greyDark,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  suffixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          )
        ],
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavigationBarTheme(
        data: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () async {
                try {
                  if (await LocationService.requestLocationPermission()) {
                    final pos = await LocationService.fetchLocation();
                    if (pos != null) {
                      widgetKey.currentState?.updateMapMarker(
                          LatLng(pos.latitude, pos.longitude));
                    }
                  }
                } catch (e, stack) {
                  AppLogger.logError(e);
                  AppLogger.logInfo(stack);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(Icons.my_location,
                          color: Colors.white, size: 18),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Locate Me',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.secondary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child:
                            Icon(Icons.location_on, color: AppColors.secondary),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentLocation,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              formatAddress(currentAddress),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.secondary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'CHANGE',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.secondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        showDragHandle: true,
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        builder: (context) => AddressBottomSheet(
                          location: currentLocation,
                          address: currentAddress,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Confirm Your Location',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 48,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
