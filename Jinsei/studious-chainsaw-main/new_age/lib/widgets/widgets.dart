import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  // color for email
  labelStyle: TextStyle(color: Colors.grey),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2)
  ),
  enabledBorder: OutlineInputBorder(        
    borderSide: BorderSide(color: Colors.grey, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  )
); 


// this is a widget to move to different screens
void nextScreenReplace(context , page){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page ));
}

// this is a snack bar widget
void showSnackBar(context, color, message){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message,
  style:const TextStyle(fontSize: 14),
  ),
   backgroundColor: color,
   action: SnackBarAction(
    label: "Ok",
    onPressed: (){},
    textColor: Colors.white,
   ),
  ));
}