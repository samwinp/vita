import 'package:flutter/material.dart';
import 'package:new_age/helper/helper_function.dart';
import 'package:new_age/pages/login_page.dart';
import 'package:new_age/pages/maptest_page.dart';
import 'package:new_age/pages/mil_info.dart';
import 'package:new_age/pages/profile_page.dart';
import '../widgets/widgets.dart';
import 'package:lottie/lottie.dart';
import 'readmore.dart';
import 'contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = '';

  @override
  void initState() {
    super.initState();
    HelperFunctions.getUserName().then((value) {
      setState(() {
        userName = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        child: Container(
          
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpeg'),
              fit: BoxFit.cover,
              ),),
          
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                child: Card(
                  color: Color.fromARGB(255, 249, 211, 171),
                  elevation: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: const LinearGradient(
                        end: Alignment.topRight,
                        begin: Alignment(0.8, 1),
                        colors: <Color>[
                          Color.fromARGB(255, 255, 137, 63),
                          Color.fromARGB(255, 252, 169, 118),
                          Color.fromARGB(200, 253, 174, 128),
                          Color.fromARGB(199, 254, 220, 198),
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
                                    'Welcome $userName!',
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Renewable energy accounts for 1/4th of the energy supply in India ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: 'poppins',
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
                              child: Lottie.asset("assets/suncard.json"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Container(
                // color: Color.fromARGB(255, 255, 137, 63),
                height: 80,
                width: 200,
                
                // borderRadius: BorderRadius.circular(10.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255,255, 137, 63),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
        
                    primary: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () => nextScreenReplace(context, MapScreen()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Get Started'),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward),
                      
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(' Explore new facts!',
                  style: TextStyle(
                    color: Color.fromARGB(255, 118, 117, 117),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 350,
                child: Align(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:  [
                      MillInfo(millname: "Solar power",millinfo: "The total installed solar power capacity was 42.633 GW" , imagePath: "assets/wind-power.json", page: ReadMore(keys: '2', heading: "Energy by Wind-power",)),
                      MillInfo(millname: "Why us",millinfo: "Solar's variability makes consistent electricity generation challenging" , imagePath: "assets/disadvantages.json", page: ReadMore(keys: "1",heading: "Why Us?",)),
                      MillInfo(millname: "Facts",millinfo: "Solar can generate electricity for up to 70% to 90% of the time" , imagePath: "assets/facts.json", page: ReadMore(keys: '3',heading:"Facts on Windmill")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
