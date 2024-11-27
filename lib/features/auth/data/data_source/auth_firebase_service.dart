import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:splitter/features/auth/data/data_source/firestore_service.dart';
import 'package:splitter/service_locator.dart';

abstract class AuthFirebaseService {
 Future<String> signIn({required String email,required String password});
  Future<String> signUp({required String name, required String email,required String password});
  Future<String> googleSignIn();
 String signOut();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService{
  static var firebaseAuth = FirebaseAuth.instance;
  static var slFirestore = ServiceLocator.sl<FirestoreService>();
  @override
  Future<String> googleSignIn() async{
    try{
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return "User cancelled google sign in";
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final cred = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      await FirebaseAuth.instance.signInWithCredential(cred);
     bool userExists= await slFirestore.userExistsOrNot();

     if(!userExists){
      String name = firebaseAuth.currentUser!.displayName!;
      String email = firebaseAuth.currentUser!.email!;
           await slFirestore.storeUserDetails(name: name, email: email);
     }
      return "User signed in through google successfully";
    }on FirebaseAuthException catch (e){
      throw Exception(e.message);
    }catch (e){
      throw Exception("Unknown error DS");
    }
  }

  @override
  Future<String> signIn({required String email, required String password}) async{
    try{
    await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return "User signed in successfully";
    }on FirebaseAuthException catch(e){
      throw Exception(e.message);
    }catch(e){
      throw Exception("Unknown error in DS signin");
    }
  }
  
  @override
  String signOut() {
    try{
      firebaseAuth.signOut();
      GoogleSignIn().signOut();
      return "Sign Out";
    }on FirebaseException catch (e){
      throw Exception(e.message);
    }catch (e){
      throw Exception("unknown error DS");
    }
  }

  @override
  Future<String> signUp({required String name,required String email,required String password}) async{
    try{
    await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    await slFirestore.storeUserDetails(name: name, email: email);
    return "user created successfully";
    }on FirebaseException catch (e){
      throw Exception(e.message);
    }catch (e){
      throw Exception("Unknown error in DS signup");
    }
  }
  
}