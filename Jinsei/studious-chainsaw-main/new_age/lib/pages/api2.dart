import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:new_age/pages/Landing_page.dart';
import 'package:new_age/pages/fail.dart';
import 'package:new_age/pages/maptest_page.dart';
import 'package:new_age/pages/sucess.dart';
import 'package:new_age/widgets/widgets.dart';

// this is the function to get the data and give it to the ml model and gets a json response of the power generated

class MyWidget extends StatefulWidget {
  late double windspeed;
  MyWidget({super.key, required double windspeed}) {
    this.windspeed = windspeed;
  }

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  double energy = 0.0;
  var temp;

  Future<String?> getData() async {
    final response = await http.post(Uri.parse('http://10.0.2.2:5000/'),
        body: jsonEncode({"wind_speed": "${widget.windspeed}"}),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      var newValue = responseJson['wind_speed'];
      print(newValue);
      newValue = newValue.replaceAll(RegExp(r'[\[\]]'), '');
      var sendBack = double.parse(newValue);
      setState(() {
        energy = sendBack;
      });
      //extra code
      if (value > energy) {
        setState(() {
          isHigh = false;
        });
      } else {
        isHigh = true;
      }
      //end of extra code
      return sendBack.toString();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  var isHigh = true;
  double value = 100;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eurus'),
        backgroundColor: Color(0xff015A62),
      ),
      body: Column(
        children: [
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
                                'Energy per Turbine',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 40),
                              Text(
                                '$energy (kW)',
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
                          child: Lottie.asset("assets/save-energy.json"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // const SizedBox(height: 15,),

          Container(
            child: isHigh
                ? Sucess(
                    energy: energy,
                  )
                : const NotFeasiblePage(),
          ),

          TextButton(
              onPressed: () {
                nextScreenReplace(context, LandingPage());
              },
              child: Text('Move to home'))
        ],
      ),
    );
  }
}
