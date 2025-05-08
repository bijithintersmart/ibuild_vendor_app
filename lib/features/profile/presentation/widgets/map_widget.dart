import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/app_utils/extension.dart';
import 'package:ibuild_vendor/core/utils/services/location_services.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

class MapControllerPage extends StatefulWidget {
  const MapControllerPage(
      {super.key, required this.mapController, this.onLoctionSave});

  final Function(Placemark)? onLoctionSave;
  final MapController mapController;

  @override
  MapControllerPageState createState() => MapControllerPageState();
}

class MapControllerPageState extends State<MapControllerPage>
    with TickerProviderStateMixin {
  bool counterRotate = false;
  late final customMarkers = <Marker>[
    buildPin(const LatLng(25.078377, 55.212439))
  ];

  final latLng = const LatLng(25.078377, 55.212439);
  Alignment selectedAlignment = Alignment.topCenter;

  static const _finishedId = 'AnimatedMapController#MoveFinished';
  static const _inProgressId = 'AnimatedMapController#MoveInProgress';
  static const _startedId = 'AnimatedMapController#MoveStarted';

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
  void initState() {
    updatePLaceDetails(latLng);
    super.initState();
  }

  void animatedMapMove(LatLng destLocation, double destZoom) {
    final camera = widget.mapController.camera;
    final latTween = Tween<double>(
        begin: camera.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: camera.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: camera.zoom, end: destZoom);
    final controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    final Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    final startIdWithTarget =
        '$_startedId#${destLocation.latitude},${destLocation.longitude},$destZoom';
    bool hasTriggeredMove = false;
    controller.addListener(() {
      final String id;
      if (animation.value == 1.0) {
        id = _finishedId;
      } else if (!hasTriggeredMove) {
        id = startIdWithTarget;
      } else {
        id = _inProgressId;
      }
      hasTriggeredMove |= widget.mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
        id: id,
      );
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });
    controller.forward();
  }

  void updatePLaceDetails(LatLng lat) async {
    final place = await LocationService.getLocationDetails(
        latitude: lat.latitude, longitude: lat.longitude);
    if (place != null) {
      if (widget.onLoctionSave != null) {
        widget.onLoctionSave!(place);
      }
    }
  }

  void updateMapMarker(LatLng lat) async {
    customMarkers.clear();
    customMarkers.add(buildPin(lat));
    animatedMapMove(lat, 12);
    updatePLaceDetails(lat);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * .7,
      child: FlutterMap(
        mapController: widget.mapController,
        options: MapOptions(
          onTap: (pos, latLng) {
            updateMapMarker(latLng);
          },
          initialCenter: latLng,
          initialZoom: 12,
          maxZoom: 12,
          minZoom: 8,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            tileProvider: CancellableNetworkTileProvider(),
            tileUpdateTransformer: _animatedMoveTileUpdateTransformer,
          ),
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

final _animatedMoveTileUpdateTransformer =
    TileUpdateTransformer.fromHandlers(handleData: (updateEvent, sink) {
  final mapEvent = updateEvent.mapEvent;
  final id = mapEvent is MapEventMove ? mapEvent.id : null;
  if (id?.startsWith(MapControllerPageState._startedId) ?? false) {
    final parts = id!.split('#')[2].split(',');
    final lat = double.parse(parts[0]);
    final lon = double.parse(parts[1]);
    final zoom = double.parse(parts[2]);

    sink.add(
      updateEvent.loadOnly(
        loadCenterOverride: LatLng(lat, lon),
        loadZoomOverride: zoom,
      ),
    );
  } else if (id == MapControllerPageState._inProgressId) {
  } else if (id == MapControllerPageState._finishedId) {
    sink.add(updateEvent.pruneOnly());
  } else {
    sink.add(updateEvent);
  }
});
