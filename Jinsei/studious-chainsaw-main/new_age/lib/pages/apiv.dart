import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_age/pages/maptest_page.dart';
import 'package:new_age/widgets/widgets.dart';

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
  var dis = "";
  var dis2 = "";
  List<double> numbers= [];

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
    RegExp regExp = RegExp(r'(\d+(?:\.\d+)?)'); // Regular expression to match numbers
     numbers = regExp.allMatches(newValue.toString()).map((match) => double.parse(match.group(0)!)).toList();
      print(numbers[0]);
      var val1 = numbers[0]; // 
      var val2 = numbers[1];
    setState(() {
       dis = val1.toString();
       dis2 = val2.toString();
     });

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
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton.icon(
              onPressed: (){getData();}, 
            icon: Icon(Icons.mail), 
            label: Text('call api')
            ),
            TextButton(onPressed: (){nextScreenReplace(context, MapScreen());}, child: Text("return back")),
            Container(
              child: Column(
                children: [
                  //make the container over here 
                 Text("${dis}"),
                 Text("${dis2}"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}