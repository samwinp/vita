import 'package:flutter/material.dart';
import 'package:new_age/pages/HomePage.dart';
import 'package:new_age/pages/Landing_page.dart';

import '../helper/helper_function.dart';
import '../widgets/widgets.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
String userName = '';
String email = '';





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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const Text("Profile",
        ),        
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
                nextScreenReplace(context, LandingPage());
              },
              selectedColor: Colors.amber,
              selected: false,
              leading:const Icon(Icons.home),
              title:const Text("Home", 
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
        
        body: Container(
          padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [      
           
            
              const Center(
                child: Icon(
                  Icons.account_circle,
                  size: 200,
                ),
              ),

            const SizedBox(height: 20,),

              Row(
                children: [
                  const Text("First name",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  ),
                  const SizedBox(width: 50,),                  
                  Text(userName,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 20
                    
                  ),
                  ),
                ],                
              ),       

              const Divider(height: 2,), 

              const SizedBox(height: 20 ,),

              Row(
                children: [
                  const Text("email",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  ),
                  const SizedBox(width: 50,),                  
                  Text(email,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 20
                    
                  ),
                  ),
                ],                
              ),                
            ],

          ),
        ),
      );    
  }
}