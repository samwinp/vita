import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:new_age/pages/Landing_page.dart';
import 'package:new_age/pages/api2.dart';
import 'package:new_age/pages/maptest_page.dart';
import 'package:new_age/widgets/widgets.dart';
// api to get the data form open wearther about the wind speed



class ApiSerivce extends StatefulWidget {
  late  double lat;
  late double lon;

  ApiSerivce({super.key,required double lat,required double lon}){    
    this.lat = lat;
    this.lon = lon;    
  }

  @override
  State<ApiSerivce> createState() => _ApiSerivceState();
}



class _ApiSerivceState extends State<ApiSerivce> {  

Future<String?> getData() async{
  var value = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=${widget.lat}&lon=${widget.lon}&appid=572880e65ae7a18ea7d56b806580c4c4"));
  var data = jsonDecode(value.body);  
  var val = data["wind"]["speed"];
  setState(() {
    windspeed = val.toString();
  });
  return val.toString();
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print('init state called');
  }

  
  String windspeed = "0.0"; 
  var temp;
  var speed;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result", 
      style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Color.fromRGBO(221, 255, 187, 1),
      elevation: 0,

      ),

      body: Center(
        child: Column(children: [   
          const SizedBox(height: 10,),   
     

          
          Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
              child: Card(
                color: Color(0xFF307A27),
                elevation: 4,
                child: Container(
                  decoration: BoxDecoration(
                    
                    gradient: LinearGradient(
                      end: Alignment.topLeft,
                      begin: Alignment(0.8, 1),
                      colors: <Color>[
                        Color(0xff19906A),
                        Color(0xff158368),
                        Color(0xff0D7066),
                        //Color(0xff015A62),
                      ], // Gradient from https://learnui.design/tools/gradient-generator.html
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      // Add your navigation logic here
                    },
                    child: Container(
                      height: 200,
                      padding: const EdgeInsets.all(26),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Wind Speed',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 40),
                                Text(
                                  '$windspeed m/s',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontFamily: 'poppins',
                                    //fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            child: Lottie.asset("assets/windy-icon.json"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          

         
      
          
          //dont touch this code
          TextButton(onPressed: (){
           speed = double.parse("$windspeed");
           nextScreenReplace(context, MyWidget(windspeed: speed));
          },
           child: Text('Click here for deeper analysis')),
      
          //don't touch this code
          Container(
            
            child: TextButton(onPressed: (){
             nextScreenReplace(context, LandingPage());
            },
             child: Text("Return back to home page"),
             ),
          )
        ]
        ),
      ),
    );
  }
}


