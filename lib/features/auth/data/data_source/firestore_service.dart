import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirestoreService {
 Future<String> storeUserDetails({required String name,required String email});
 getUserDetails({required String email});
 Future<bool> userExistsOrNot();
}

class FirestoreServiceImpl implements FirestoreService{
  static var firestore=FirebaseFirestore.instance;
  @override
 Future<String> storeUserDetails({required String name, required String email}) async{
  try{
   await firestore.collection('users').doc(email).set({
      "name":name,
      "email":email
    });
    return "user data created DS";
  }on FirebaseException catch(e){
    throw Exception(e.message);
  }catch (e){
    throw Exception(e);
  }
  }
  
  @override
  getUserDetails({required String email}) {
    // TODO: implement getUserDetails
    throw UnimplementedError();
  }
  
  @override
  Future<bool> userExistsOrNot() async{
    String email=FirebaseAuth.instance.currentUser!.email!;
   var userData= await firestore.collection('users').doc(email).get();
   return userData.exists;
  }
}