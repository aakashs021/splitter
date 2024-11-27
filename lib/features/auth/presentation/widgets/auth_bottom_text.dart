import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitter/features/auth/presentation/widgets/auth_signing_button.dart';
import 'package:splitter/router/app_router_constants.dart';

Widget authBottomText(
    {required BuildContext context,
    required String content,
    required String link,
    required AuthPageType textType}) {
  return Padding(
    padding:  EdgeInsets.symmetric(vertical: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          content,
          style:  TextStyle(fontSize: 15),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            if (textType == AuthPageType.signin) {
              GoRouter.of(context)
                  .pushNamed(AppRouterConstants.signUpPageRouterName);
            } else {
              GoRouter.of(context)
                  .pushNamed(AppRouterConstants.signInPageRouterName);
            }
          },
          child: Text(
            link,
            style:  TextStyle(color: Colors.blue, fontSize: 16),
          ),
        ),
      ],
    ),
  );
}
