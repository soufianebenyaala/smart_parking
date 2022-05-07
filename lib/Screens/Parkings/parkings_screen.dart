import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:smartparkingv2/Screens/Parkings/components/body.dart';
import '../../services/api_manger.dart';
import '../../services/geolocator_service.dart';
import '../../services/marker_service.dart';

class ParkingsScreen extends StatefulWidget {
  @override
  State<ParkingsScreen> createState() => _ParkingsScreenState();
}

class _ParkingsScreenState extends State<ParkingsScreen> {
  final markerService = MarkerService();
  Position? currentPosition;
  StreamSubscription<Position>? positionStream;
  var _parkings;
  bool _isLoading = false;
  Set<Marker> markers = {};

  @override
  void dispose() {
    super.dispose();

    /// don't forget to cancel stream once no longer needed
    positionStream?.cancel();
  }

  @override
  void initState() {
    super.initState();
    getparkings();
    GeoLocationService.determinePosition()
        .then((value) => {listenToLocationChanges()});
  }

  Future<void> getparkings() async {
    _parkings = await ApiManager.getparkings();
    if (_parkings != null) {
      setState(() {
        markers = {};
        if (_parkings.length > 0) {
          for (var i = 0; i < _parkings.length; i++) {
            var newMarker =
                markerService.createMarkerFromParking(_parkings[i], false);
            markers.add(newMarker);
          }
        }
        _isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      FractionallySizedBox(
        alignment: Alignment.topCenter,
        heightFactor: 0.6,
        child: currentPosition != null
            ? Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      zoomGesturesEnabled: true,
                      //mapType: MapType.hybrid,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(currentPosition!.latitude,
                            currentPosition!.longitude),
                        zoom: 14.4746,
                      ),
                      markers: markers,
                    ),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      FractionallySizedBox(
        alignment: Alignment.bottomCenter,
        heightFactor: 0.5,
        child: Body(parkings: _parkings),
      )
    ]));
  }

  void listenToLocationChanges() {
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings).listen(
      (Position? position) {
        print(position == null ? 'Unknown' : '$position');
        setState(() {
          currentPosition = position;
        });
      },
    );
  }
  /*void getLastKnownPosition() async {
    Position? position = await Geolocator.getLastKnownPosition();
  }


  void calculateDistance() {
    /// startLatitude, startLongitude, endLatitude, endLongitude
    double distanceInMeters = Geolocator.distanceBetween(
        52.2165157, 6.9437819, 52.3546274, 4.8285838);
  }*/
}
