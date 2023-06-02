import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService{
  final String? uid;
  DatabaseService({this.uid });

  // reference for the collection
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  
   

  //updata the user data 
  Future updataUserData(String fullname, String email) async{
    return await  userCollection.doc(uid).set({
      "fullname": fullname,
      "email": email,
      'uid': uid,
    }
    );
   
  }

  // getting user data
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot = await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  //get database service file
  Future getUserGroups() async{
     return userCollection.doc(uid).snapshots();
  }

}