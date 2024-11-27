import 'package:dartz/dartz.dart';
import 'package:splitter/features/auth/data/model/user_signin_model.dart';
import 'package:splitter/features/auth/data/model/user_signup_model.dart';

abstract class AuthRepository {
  Future<Either<String,String>> signIn({required UserSigninModel userModel});

  Future<Either<String,String>> signUp({required UserSignupModel userModel});

  Future<Either<String,String>> googleSignIn();

  Either<String,String> signOut();
}