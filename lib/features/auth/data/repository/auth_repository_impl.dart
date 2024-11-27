import 'package:dartz/dartz.dart';
import 'package:splitter/features/auth/data/data_source/auth_firebase_service.dart';
import 'package:splitter/features/auth/data/model/user_signin_model.dart';
import 'package:splitter/features/auth/data/model/user_signup_model.dart';
import 'package:splitter/features/auth/domain/repostiory/auth_repository.dart';
import 'package:splitter/service_locator.dart';

class AuthRepositoryImpl implements AuthRepository{
  static var sl=ServiceLocator.sl<AuthFirebaseService>();
  @override
  Future<Either<String, String>> googleSignIn() async{
    try{
      await sl.googleSignIn();
      return right("Google sign in success");
    }catch (e){
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> signIn({required UserSigninModel userModel})async {
    try{
    await sl.signIn(email: userModel.email, password: userModel.password);
    return right('User Signed in success');
    }catch (e){
      return left(e.toString());
    }
   
  }

  @override
  Either<String, String> signOut() {
    try{
        sl.signOut();
        return right("User sign out success");
    }catch (e){
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> signUp({required UserSignupModel userModel})async {
    try{
      await sl.signUp(name: userModel.name, email: userModel.email, password: userModel.password);
      return right("User sign up success");
    }catch (e){
      return left(e.toString());
    }
  }
}