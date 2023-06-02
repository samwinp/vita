// this is a map in which the user selects the location and get data about the place
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool isSafe = true;

  // this is the inital pos of the map
  static const CameraPosition _initialCameraPostion = CameraPosition(
    target: LatLng(12.924416, 79.115194),
    zoom: 11.4,
  ); 


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [GoogleMap(
        initialCameraPosition: _initialCameraPostion,
        markers: {
          Marker(
            markerId: MarkerId("this feeling is horible"),
            position: LatLng(12.924416, 79.115194),
            draggable: true,
            onDrag: (value){            
             print(value);
            }
            )
        },
        
     
      ),  
      ]
    );
  }
}