import 'package:firebase_auth/firebase_auth.dart';
import '../helper/helper_function.dart';
import 'database_services.dart';

class AuthService{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //login 
  Future loginWithUserNameansPassword(String  email, String password) async{
    try{
      User user = (await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user!;
      
      if(user != null){
        return true;
      }

    }on FirebaseAuthException catch (e){
      print(e.message);
      return e.message;
    }

  } 


  //register
  Future registerUserWithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password)).user!;
       print("hi");
      if (user != null) {
        // call our database service to update the user data.
        await DatabaseService(uid: user.uid).updataUserData(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }


  //sign out can you hear me ? reply here --
  Future singOut() async{
    try{
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmail("");
      await HelperFunctions.saveUserName("");
      await firebaseAuth.signOut(); 

    }catch(e){
      print("dead");
    }

  }

}