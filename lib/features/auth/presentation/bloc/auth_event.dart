import 'package:splitter/features/auth/data/model/user_signin_model.dart';
import 'package:splitter/features/auth/data/model/user_signup_model.dart';

abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final UserSignupModel userModel;

  SignUpEvent({required this.userModel});
}

class SignInEvent extends AuthEvent{
  final UserSigninModel userModel;

  SignInEvent({required this.userModel});

}