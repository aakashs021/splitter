import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:splitter/core/configs/theme/app_colors.dart';
import 'package:splitter/features/auth/domain/usecase/auth_usecase.dart';
import 'package:splitter/features/auth/presentation/widgets/auth_bottom_text.dart';
import 'package:splitter/features/auth/presentation/widgets/auth_signing_button.dart';
import 'package:splitter/features/auth/presentation/widgets/auth_text_form_feild.dart';
import 'package:splitter/features/auth/presentation/widgets/google_sign_in.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final formkey = GlobalKey<FormState>();

  final List<TextEditingController> controller = List.generate(
    2,
    (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.authBGColor,
      body: kIsWeb
          ? WebSignIn(w, h, context, controller, formkey)
          : androidSignIn(w, h, context, controller, formkey),
      bottomNavigationBar: authBottomText(
          textType: AuthPageType.signin,
          context: context,
          content: 'Not a member?',
          link: 'Register Now'),
    );
  }
}

Form androidSignIn(double w, double h, BuildContext context,
    List<TextEditingController> controller, GlobalKey<FormState> formkey) {
  return Form(
    key: formkey,
    child: Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 600,
        ),
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
                  validation: validateEmail,
                  controller: controller[0],
                  labelName: "Email"),
              SizedBox(height: h * 0.02),
              AuthTextFormFeild(
                  validation: validatename,
                  controller: controller[1],
                  labelName: "Password"),
              SizedBox(height: h * 0.02),
              AuthSigningButton(
                pageType: AuthPageType.signin,
                signingfunction: () => AuthUsecase.signInFunction(
                    context: context,
                    email: controller[0].text,
                    password: controller[1].text,
                    pageType: AuthPageType.signin,
                    formkey: formkey),
              ),
              SizedBox(
                height: h * 0.005,
              ),
              SizedBox(height: h * 0.01),
              GoogleSignInButton()
            ],
          ),
        ),
      ),
    ),
  );
}

Widget WebSignIn(double w, double h, BuildContext context,
    List<TextEditingController> controller, GlobalKey<FormState> formkey) {
  return SingleChildScrollView(
    child: Form(
      key: formkey,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 600,
          ),
          child: Padding(
            padding: EdgeInsets.all(w * 0.05),
            child: Column(
              children: [
                // SizedBox(height: h * 0.03),
                const Icon(
                  color: Colors.black,
                  Icons.lock,
                  size: 200,
                ),
                SizedBox(height: h * 0.05),
                AuthTextFormFeild(
                    validation: validateEmail,
                    controller: controller[0],
                    labelName: "Email"),
                SizedBox(height: h * 0.02),
                AuthTextFormFeild(
                    validation: validatename,
                    controller: controller[1],
                    labelName: "Password"),
                SizedBox(height: h * 0.02),
                AuthSigningButton(
                  pageType: AuthPageType.signin,
                  signingfunction: () => AuthUsecase.signInFunction(
                      context: context,
                      email: controller[0].text,
                      password: controller[1].text,
                      pageType: AuthPageType.signin,
                      formkey: formkey),
                ),
                SizedBox(
                  height: h * 0.005,
                ),
                SizedBox(height: h * 0.01),
                GoogleSignInButton()
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
