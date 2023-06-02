import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Apiv extends StatefulWidget {
  late double lat;
  late double lon;
  Apiv({super.key, required double lat, required lon }){
    this.lat = lat;
    this.lon = lon;
  }

  @override
  State<Apiv> createState() => _ApivState();
}

class _ApivState extends State<Apiv> {
  // this is the code to make a post requets
  Future<String?> getData() async {
  print("${widget.lat} latitude and ${widget.lon}");
  final response = await http.post(Uri.parse('http://10.0.2.2:5000/'),
      body: jsonEncode({"lat": "${widget.lat}","lon": "${widget.lon}"}),
      headers: {'Content-Type': 'application/json'});
  if (response.statusCode == 200) {
    final responseJson = jsonDecode(response.body);   
    var newValue = responseJson;
    print("${newValue} there is no shit");  

    //end of extra code
 
  }else{
    print("messed up");
  }
}






 //end of code


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("vaibhav"),),
      body: Container(
        child: TextButton.icon(onPressed: (){getData();}, icon: Icon(Icons.mail), label: Text('call api'))
      ),
    );
  }
}