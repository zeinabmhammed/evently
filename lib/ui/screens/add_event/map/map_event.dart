import 'package:evently/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapEvent extends StatefulWidget {
  const MapEvent({super.key});

  @override
  State<MapEvent> createState() => _MapEventState();
}

class _MapEventState extends State<MapEvent> {
  bool isLocationDetected = false;
  late LocationData locationData;
  late GoogleMapController mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    getLocation().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLocationDetected
          ? Stack(
              alignment: Alignment.bottomCenter,
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  onMapCreated: (controller) {
                    mapController = controller;
                  },
                  onTap: (position) {
                    mapController.animateCamera(
                      CameraUpdate.newLatLng(position),
                    );
                    markers.add(
                      Marker(markerId: MarkerId("1"), position: position),
                    );
                    setState(() {});
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      locationData.latitude ?? 0,
                      locationData.longitude ?? 0,
                    ),
                    zoom: 15,
                  ),
                  markers: markers,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(color: AppColors.lightPrimary),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightPrimary,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(),
                        ),
                        child: Text(
                          "Tap on Location To Select",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Future<void> getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    isLocationDetected = true;
    markers.add(
      Marker(
        markerId: MarkerId("1"),
        position: LatLng(
          locationData.latitude ?? 0,
          locationData.longitude ?? 0,
        ),
      ),
    );
    location.onLocationChanged.listen((LocationData currentLocation) {
      mapController.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(currentLocation.latitude ?? 0, currentLocation.longitude ?? 0),
        ),
      );
      location.changeSettings(interval: 1000, distanceFilter: 100);
      location.onLocationChanged.listen((location) {});
    });
  }
}
