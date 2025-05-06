import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/app_utils/extension.dart';
import 'package:latlong2/latlong.dart';

class MapControllerPage extends StatefulWidget {
  static const String route = 'map_controller';
  final MapController mapController;
  const MapControllerPage({super.key, required this.mapController});

  @override
  MapControllerPageState createState() => MapControllerPageState();
}

class MapControllerPageState extends State<MapControllerPage> {
  final latLng = const LatLng(25.078377, 55.212439);

  late final customMarkers = <Marker>[
    buildPin(const LatLng(25.078377, 55.212439))
  ];
  bool counterRotate = false;
  Alignment selectedAlignment = Alignment.topCenter;

  Marker buildPin(LatLng point) => Marker(
        point: point,
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tapped existing marker'),
              duration: Duration(seconds: 1),
              showCloseIcon: true,
            ),
          ),
          child: Icon(Icons.location_pin, size: 60, color: AppColors.secondary),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * .7,
      child: FlutterMap(
        mapController: widget.mapController,
        options: MapOptions(
          onTap: (pos, latLng) {
            setState(() {
              customMarkers.clear();
              customMarkers.add(buildPin(latLng));
              widget.mapController.move(latLng, 9.2);
            });
          },
          initialCenter: latLng,
          initialZoom: 9.2,
        ),
        children: [
          MarkerLayer(
            markers: customMarkers,
            rotate: counterRotate,
            alignment: selectedAlignment,
          ),
        ],
      ),
    );
  }
}
