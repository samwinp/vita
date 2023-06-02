import 'package:flutter/material.dart';
import 'package:new_age/pages/Landing_page.dart';
import 'package:new_age/pages/api.dart';
import 'package:new_age/pages/maptest_page.dart';
import 'package:new_age/widgets/widgets.dart';


class PickLocation extends StatefulWidget {
  late double latitude;
  late double longitude;

  PickLocation({super.key,required double latitude,required double longitude}){
    this.latitude = latitude;
    this.longitude = longitude;
  }

  @override
  State<PickLocation> createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text("${widget.latitude}"),
              Text("${widget.longitude}"),
              IconButton(onPressed: (){
                nextScreenReplace(context, LandingPage());
              },
               icon: Icon(Icons.cancel)),

              IconButton(onPressed: (){
                nextScreenReplace(context, ApiSerivce(lat: widget.latitude, lon: widget.longitude));
              },
               icon: Icon(Icons.select_all))
            ],
          ),
        ),
      ),
    );
  }
}