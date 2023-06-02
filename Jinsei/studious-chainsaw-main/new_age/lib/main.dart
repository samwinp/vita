import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_age/chart/mapbar_gaph.dart';
import 'package:new_age/pages/HomePage.dart';
import 'package:new_age/pages/Landing_page.dart';
import 'package:new_age/pages/api.dart';
import 'package:new_age/pages/api2.dart';
import 'package:new_age/pages/apiv.dart';
import 'package:new_age/pages/login_page.dart';
import 'package:new_age/pages/maptest_page.dart';
import 'firebase_options.dart';
import 'helper/helper_function.dart';

void main() async {
  // to ensure that the widget is initialized
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}





class _MyAppState extends State<MyApp> {
 
  bool _isSingnedIn = false;


  @override
  void initState() {
  
    super.initState();
    getUserloggedInStatus();

  }

  getUserloggedInStatus() async{
    await HelperFunctions.getUserloggedInStatus().then((value) {
      if(value != null){     
        setState(() {
           _isSingnedIn = value;                 
        });         
      }
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(      
     debugShowCheckedModeBanner: false,    
     home: LandingPage()
    );
  }
}

// _isSingnedIn ? LandingPage() : LoginPage()
//  LandingPage(),

// _isSingnedIn ? MyWidget() :

// LandingPage()