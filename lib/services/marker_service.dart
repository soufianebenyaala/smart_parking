import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smartparkingv2/models/parking.dart';

class MarkerService {

  Marker createMarkerFromParking(Parking parking, bool center) {
    var markerId =parking.id;
    if (center) markerId = 'center';

    return Marker(
        markerId: MarkerId(markerId ?? "None"),
        draggable: false,
        visible: (center) ? false : true,
        infoWindow: InfoWindow(
            title:parking.name, snippet:parking.status),
        position: LatLng(parking.latitude ?? 0,
           parking.longitude ?? 0)
    );
  }


}