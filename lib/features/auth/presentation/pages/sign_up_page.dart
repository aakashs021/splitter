import 'package:flutter/material.dart';
import 'package:splitter/core/configs/theme/app_colors.dart';
import 'package:splitter/features/auth/domain/usecase/auth_usecase.dart';
import 'package:splitter/features/auth/presentation/widgets/auth_bottom_text.dart';
import 'package:splitter/features/auth/presentation/widgets/auth_signing_button.dart';
import 'package:splitter/features/auth/presentation/widgets/auth_text_form_feild.dart';
import 'package:splitter/features/auth/presentation/widgets/google_sign_in.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final formkey = GlobalKey<FormState>();

  final List<TextEditingController> controller = List.generate(
    3,
    (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.authBGColor,
      body: SafeArea(
          child: Form(
            key: formkey,
        child: Padding(
          padding: EdgeInsets.all(w * 0.05),
          child: ListView(
            children: [
              SizedBox(height: h * 0.05),
              const Icon(
                color: Colors.black,
                Icons.lock,
                size: 200,
              ),
              SizedBox(height: h * 0.05),
              AuthTextFormFeild(
                  validation: validatename,
                  controller: controller[0],
                  labelName: "name"),
              SizedBox(height: h * 0.02),
              AuthTextFormFeild(
                  validation: validateEmail,
                  controller: controller[1],
                  labelName: "Email"),
              SizedBox(height: h * 0.02),
              AuthTextFormFeild(
                  validation: validatename,
                  controller: controller[2],
                  labelName: "Password"),
              SizedBox(height: h * 0.02),

              AuthSigningButton(
                pageType: AuthPageType.signup,
                signingfunction: () => AuthUsecase.signUpFunction(
                    context: context,
                    name: controller[0].text,
                    email: controller[1].text,
                    password: controller[2].text,
                    pageType: AuthPageType.signup,
                    formkey: formkey),
              ),
              SizedBox(
                height: h * 0.005,
              ),
              SizedBox(height: h * 0.01),
              const GoogleSignInButton()
            ],
          ),
        ),
      )),
      bottomNavigationBar: authBottomText(
            textType: AuthPageType.signup,
            context: context,
            content: 'Alredy have an account?',
            link: 'Sign In'),
    );
  }
}

