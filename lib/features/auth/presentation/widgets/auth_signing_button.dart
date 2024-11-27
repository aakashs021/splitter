import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:splitter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:splitter/features/auth/presentation/bloc/auth_state.dart';
import 'package:splitter/features/auth/presentation/widgets/auth_snackbar.dart';
import 'package:splitter/features/auth/presentation/widgets/loading_indicator.dart';
import 'package:splitter/router/app_router_constants.dart';

enum AuthPageType { signin, signup }

class AuthSigningButton extends StatelessWidget {
  final VoidCallback signingfunction;
  final AuthPageType pageType;
  const AuthSigningButton({
    super.key,
    required this.pageType,
    required this.signingfunction,
  });

  @override
  Widget build(BuildContext context) {
    String buttonName;
    if (pageType == AuthPageType.signin) {
      buttonName = "Login";
    } else {
      buttonName = "Sign Up";
    }
    return SizedBox(
      height: 50,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            if (state.isLogin) {
              GoRouter.of(context).goNamed(AppRouterConstants.homePageRouterName);
            } else {
              GoRouter.of(context).goNamed(AppRouterConstants.signInPageRouterName);
            }
          }
          if (state is AuthFailure) {
            authSnackBar(context: context, state: state);
          }
        },
        builder: (context, state) {
          return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: signingfunction,
              child: elevatedButtonText(state, buttonName));
        },
      ),
    );
  }
}

Widget elevatedButtonText(var state, String buttonName) {
  if (state is AuthLoading) {
    return loadingIndicator();
  } else {
    return Text(
      buttonName,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}
