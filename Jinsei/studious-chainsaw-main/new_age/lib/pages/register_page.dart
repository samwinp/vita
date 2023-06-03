import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_age/pages/api.dart';
import '../helper/helper_function.dart';
import '../services/auth_services.dart';
import '../widgets/widgets.dart';
import 'HomePage.dart';
import 'Landing_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  final _fromKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String fullname = ''; 
  AuthService authService = AuthService();

  // login(){    
  //   if(_fromKey.currentState!.validate())(){};
  // }


 late bool _isLoading;

  register() async{
    if(_fromKey.currentState!.validate()){
      setState(() {
        _isLoading = true;
      });
      await authService.registerUserWithEmailandPassword(fullname, email, password).then((value) async {
        if(value == true){
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmail(email);          
          await HelperFunctions.saveUserName(fullname); 
          nextScreenReplace(context, LandingPage());
        }else{
          showSnackBar(context, Colors.red, value);
          setState(() {            
            _isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _isLoading = false;
    return _isLoading ? Center(child: CircularProgressIndicator(color: Colors.redAccent),) : Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
            child: Form(
              key: _fromKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 0,),
                  const Center(
                  child:Text("Vita",
                   style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                    color: Color.fromARGB(255, 253, 140, 71)
                   ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Text('Explore a whole new world',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 253, 140, 71)
                ),
                ),
                const SizedBox(height: 40,),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color.fromARGB(255, 248, 247, 247),
                  child:  Lottie.asset("assets/solarfront.json"),
                ),
                const SizedBox(height: 50,),
                // this is changes done by pereira
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    labelText: 'First Name',
                    prefixIcon:const Icon(Icons.person,
                    color: Colors.grey,
                    )
                  ),
                  onChanged: (value) {
                    setState(() {
                      fullname = value;
                    });
                  },
                  validator: (value) {
                    return value!.length < 6 ? 'your name should be greater than 6 characters' : null;
                  },
                ),
              const  SizedBox(height:20,),
                // end of the pereira changes
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.mail,
                    color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                      print(email);
                    });
                  },// this line to validate the password
                  validator: (value) {
                    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!) ? null : 'enter a valid email id';
                  },
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock,
                    color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    password = value;
                    print(password);
                  },
                  validator: (value) {
                    return value!.length < 6 ? "enter a password with length greater than six characters" : null;
                  },
                ),
                SizedBox(height: 40,),
                SizedBox(height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(180, 227, 138, 82),
                  ),
                  onPressed: (){
                    register();
                    },
                 child:const Text("Register now",
                 style: TextStyle(
                  // add style to the sigin in button
                  fontSize: 16,
                 ),
                 )
                ),
                ),
              const  SizedBox(height: 15,),
                Text.rich(
                  TextSpan(
                    text: "Already registered?  ",
                    children: <TextSpan>[
                      TextSpan(
                        text: "Sign In",
                        style: const TextStyle(
                          color: Color.fromARGB(180, 227, 138, 82),
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap  = () {
                          nextScreenReplace(context, LoginPage());
                        },
                      )
                    ]
                  )
                )
                ],
              ),
            ),
          ),
        ),
      ), 
    );
  }
}