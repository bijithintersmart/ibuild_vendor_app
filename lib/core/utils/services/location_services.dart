import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:ibuild_vendor/core/constant/app_strings.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/app_utils/app_life_cylcle_util.dart';
import 'package:ibuild_vendor/core/utils/app_utils/app_logger.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  static final Color _primaryColor = AppColors.secondary;
  static const _backgroundColorDark = Color(0xFFE0E0E0);
  static const _textColorLight = Color(0xFF121212);

  /// Checks location service and permission, opens settings or dialogs if needed.
  static Future<bool> ensurePermissions() async {
    final context = navigatorKey.currentContext!;
    if (!await Geolocator.isLocationServiceEnabled()) {
      if (context.mounted) {
        await _showLocationServiceDialog(context);
      }
      return false;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      if (context.mounted) {
        await _showPermissionDeniedDialog(context);
      }
      return false;
    }

    if (permission == LocationPermission.deniedForever) {
      // GoRouter.of(navigatorKey.currentContext!).push(Routes.LOCATION);
      return false;
    }

    return true;
  }

  /// Requests foreground permission using `permission_handler`.
  static Future<bool> requestLocationPermission() async {
    final status = await Permission.locationWhenInUse.request();
    return status.isGranted;
  }

  static Future<bool> openLocationSettings() async {
    return await Geolocator.openLocationSettings();
  }

  static Future<Position?> fetchLocation() async {
    try {
      if (!await ensurePermissions()) return null;
      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.bestForNavigation,
        ),
      );
    } catch (e) {
      AppLogger.logError('Error fetching location: $e');
      return await Geolocator.getLastKnownPosition();
    }
  }

  static Future<Placemark?> getLocationDetails({
    required double latitude,
    required double longitude,
  }) async {
    if (!await requestLocationPermission()) {
      return null;
    }
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity.first != ConnectivityResult.none) {
      try {
        final placemarks = await placemarkFromCoordinates(latitude, longitude);
        if (placemarks.isNotEmpty) {
          final place = placemarks.first;
          return place;
        }
      } catch (e) {
        AppLogger.logError('Geocoding error: $e');
      }
    }
    return null;
  }

  /// Dialog to prompt enabling location services.
  static Future<void> _showLocationServiceDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: _backgroundColorDark.withOpacity(.8),
      builder: (_) => PopScope(
        canPop: false,
        child: AlertDialog(
          elevation: 5,
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: _backgroundColorDark,
          title: NormalText(
            text: 'Location Services Disabled',
            style: _dialogTitleStyle(),
          ),
          content: const SingleChildScrollView(
            child: Column(
              children: [
                Icon(Icons.location_off, color: Colors.red, size: 50),
                SizedBox(height: 15),
                NormalText(
                  text:
                      'Location services are disabled. Please enable location services to use this feature.',
                  maxLine: 4,
                  style: TextStyle(
                    color: _textColorLight,
                    fontFamily: AppStringsConstants.fontFamily,
                    letterSpacing: .6,
                  ),
                  align: TextAlign.start,
                ),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                    onPressed: () => SystemNavigator.pop(),
                    child: const NormalText(
                      text: 'Exit App',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontFamily: AppStringsConstants.fontFamily,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: _primaryColor,
                        minimumSize: const Size(230, 40)),
                    onPressed: () async {
                      final opened = await Geolocator.openLocationSettings();
                      AppLogger.logInfo("Settings opened: $opened");
                      if (opened && context.mounted) {
                        Navigator.of(context).pop();
                        AppLifecycleUtil.instance.resetOnResume();
                        AppLifecycleUtil.instance.listen(
                          onResume: () {
                            AppLogger.logInfo("Resumed - Fetching location...");
                          },
                        );
                      }
                    },
                    child: const NormalText(
                      text: 'Open Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: AppStringsConstants.fontFamily,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Dialog shown when location permission is denied.
  static Future<void> _showPermissionDeniedDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: _backgroundColorDark,
        title:
            Text('Permission Denied', style: TextStyle(color: Colors.red[400])),
        content: const SingleChildScrollView(
          child: Column(
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 50),
              SizedBox(height: 15),
              Text(
                'Location permission is required for this app to function. Would you like to grant permission?',
                style: TextStyle(color: _textColorLight),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: _primaryColor),
            onPressed: () async {
              Navigator.of(context).pop();
              await Geolocator.requestPermission();
            },
            child: const Text('Request Permission'),
          ),
        ],
      ),
    );
  }

  static TextStyle _dialogTitleStyle() {
    return TextStyle(
      color: _primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
      letterSpacing: .5,
      fontFamily: AppStringsConstants.fontFamily,
    );
  }
}
