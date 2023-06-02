import 'package:flutter/material.dart';
import 'package:new_age/chart/mapbar_gaph.dart';
import 'package:new_age/pages/HomePage.dart';
import 'package:new_age/pages/login_page.dart';
import 'package:new_age/pages/maptest_page.dart';
import 'package:new_age/pages/profile_page.dart';
import 'package:new_age/widgets/widgets.dart';
import 'contact.dart';

import '../helper/helper_function.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOption = <Widget>[
    const HomePage(),// this is perfect no need to change
    MapScreen(),// this is done temp it has to changed to map soon
    GraphPage()// this has to be changes to list of hospital
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }


  String email = '';
  String userName = '';
  

  @override
  void initState() {
    // TODO: implement initState
    HelperFunctions.getUserName().then((value) {
      setState(() {
        userName = value!;
      });    
    }   
    );
    HelperFunctions.getUserEmail().then((value) {
      setState(() {
        email = value!;
      });
    });
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("EURUS",
      style: TextStyle(
        color: Colors.white,
      ),
      ),
      elevation: 0,
       backgroundColor:Color(0xff015A62),
      ),

       drawer: Drawer(    
          backgroundColor:const Color.fromARGB(225, 255, 255, 255),
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 50),
            children:  [
              const Icon(Icons.account_circle,
              size: 100,
              color: Colors.white,
              ),
              const SizedBox(height: 10,),
              Center(
                child: Text(userName, 
                style: const TextStyle(                 
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold, 
                  fontSize: 20,                  
                ),                      
                ),             
              ),
            const SizedBox(height: 10,),
            const Divider(
              height: 2,
            ),

            ListTile(
              onTap: (){
                nextScreenReplace(context, ProfilePage());
              },
              selectedColor: Colors.amber,
              selected: false,
              leading:const Icon(Icons.person),
              title:const Text("profile", 
              style: TextStyle(
              color: Colors.black,
              ),              
              ),
              
            ),
            const Divider(height: 2,),

            ListTile(
              onTap: (){
                showDialog(
                  context: context,
                   builder: (context){                  
                  return AlertDialog(                    
                    title:const Text("Logout"),
                    content:const Text("Are you sure you want to logout"),
                    actions: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);                        
                      }, 
                      icon:const Icon(
                      Icons.cancel,
                      color: Colors.red,
                      )
                      ),
                      IconButton(onPressed: (){
                        nextScreenReplace(context, LoginPage());
                      },
                      icon:const Icon(
                      Icons.done,
                      color: Colors.green,                      
                      )
                      )
                    ],          
                    
                  );
                }
                );               

                
              },
              selectedColor: Colors.amber,
              selected: false,
              leading:const Icon(Icons.logout),
              title:const Text("Logout", 
              style: TextStyle(
              color: Colors.black,
              ),              
              ),         

            )
            ],
          ),
        ),



      
        bottomNavigationBar: Theme(
          data: ThemeData(
            canvasColor: Colors.white,
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
                      
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color:Color(0xff19907A),
                ),
                label: "home",
              ),
              BottomNavigationBarItem(icon: Icon(Icons.map,color:Color(0xff19907A),), label: "maps"),
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_page,color:Color(0xff19907A),),
                label: "Contact",
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.green[900],
            onTap: _onItemTapped,
            elevation: 0,
          ),
        ),


    body: Container(
          child: _widgetOption.elementAt(_selectedIndex),
        ),


      );    

  }
}