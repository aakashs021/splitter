import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splitter/features/auth/data/model/user_signin_model.dart';
import 'package:splitter/features/auth/data/model/user_signup_model.dart';
import 'package:splitter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:splitter/features/auth/presentation/bloc/auth_event.dart';
import 'package:splitter/features/auth/presentation/widgets/auth_signing_button.dart';

class AuthUsecase {
  static signInFunction(
      {required GlobalKey<FormState> formkey,
      required BuildContext context,
      required AuthPageType pageType,
      required String email,
      required String password}) {
    if (formkey.currentState!.validate()) {
      UserSigninModel userModel =
          UserSigninModel(email: email, password: password);
      BlocProvider.of<AuthBloc>(context).add(SignInEvent(userModel: userModel));
    }
  }

  static signUpFunction(
      {required GlobalKey<FormState> formkey,
      required BuildContext context,
      required AuthPageType pageType,
      required String name,
      required String email,
      required String password}) {
    if (formkey.currentState!.validate()) {
      UserSignupModel userModel =
          UserSignupModel(email: email, password: password, name: name);
      BlocProvider.of<AuthBloc>(context).add(SignUpEvent(userModel: userModel));
    }
  }
}
