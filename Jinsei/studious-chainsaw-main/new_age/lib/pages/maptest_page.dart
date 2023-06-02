import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_age/pages/api.dart';
import 'package:new_age/pages/choose_location.dart';
import 'package:new_age/pages/delete.dart';
import 'package:new_age/widgets/widgets.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _center = LatLng(12.910412, 74.898098);
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {}

  void _onMarkerTapped(LatLng position) {
    print("Marker tapped: $position");
    print(position.latitude);
    print(position.longitude);
    nextScreenReplace(context, Apiv(lat: position.latitude, lon: position.longitude));
  }

  void _onMapTapped(LatLng position) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          onTap: () {
            _onMarkerTapped(position);
          } ,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: _markers,
        onTap: _onMapTapped,
      ),
    );
  }
}