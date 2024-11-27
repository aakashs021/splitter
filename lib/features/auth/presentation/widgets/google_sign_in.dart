import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:splitter/core/configs/assets/app_images.dart';
import 'package:splitter/features/auth/presentation/bloc/auth_state.dart';
import 'package:splitter/features/auth/presentation/cubit/g_cubit.dart';
import 'package:splitter/features/auth/presentation/widgets/auth_snackbar.dart';
import 'package:splitter/features/auth/presentation/widgets/loading_indicator.dart';
import 'package:splitter/router/app_router_constants.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Row(
          children: [
            Expanded(child: Divider()),
            SizedBox(
              width: 10,
            ),
            Text('or'),
            SizedBox(
              width: 10,
            ),
            Expanded(child: Divider())
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        BlocListener<GoogleSignInCubit, GoogleSignInState>(
          listener: (context, state) {
            if (state == GoogleSignInState.loading) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    content: Align(
                      alignment: Alignment.center,
                      child: Container(
                          // color: Colors.red,
                          width: 200,
                          height: 10,
                          child: loadingIndicator()),
                    ),
                  );
                },
              );
            }
            if (state == GoogleSignInState.success) {
              GoRouter.of(context)
                  .goNamed(AppRouterConstants.homePageRouterName);
            }
            if (state == GoogleSignInState.failure) {
              context.pop();
              authSnackBar(
                  context: context,
                  state: AuthFailure(
                      errorMessage: "Google signing unsuccessfull"));
            }
          },
          child: InkWell(
            onTap: () {
              BlocProvider.of<GoogleSignInCubit>(context).signInWithGoogle();
              // context.pop();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Image.asset(
                AppImages.authGoogleLogo,
                height: 100,
              ),
            ),
          ),
        )
      ],
    );
  }
}
