import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  //keys
  static String userLoggedInKey = 'LOGGEDINKEY';
  static String userNamedKey = 'USERNAMEKEY';
  static String userEmailKey = 'USEREMAILKEY';

  //saving shared preferences
  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf  = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn); 
  }


  static Future<bool> saveUserName(String userName) async {
    SharedPreferences sf  = await SharedPreferences.getInstance();
    return await sf.setString(userNamedKey, userName);
  }


  static Future<bool> saveUserEmail(String userEmail) async {
    SharedPreferences sf  = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }

  
  //getting  data from shared preferences
  static Future<bool?> getUserloggedInStatus() async{
    SharedPreferences sf =  await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }  


  static Future<String?> getUserEmail() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);    
  }

   static Future<String?> getUserName() async{
    SharedPreferences sf =  await SharedPreferences.getInstance();
    return sf.getString(userNamedKey);
  }  

  



}