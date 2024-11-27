import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:splitter/features/auth/presentation/bloc/auth_state.dart';

authSnackBar({required BuildContext context, required AuthFailure state}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
          title: "",
          message: state.errorMessage,
          contentType: ContentType.failure)));
}
