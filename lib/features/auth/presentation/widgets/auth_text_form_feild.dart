// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AuthTextFormFeild extends StatelessWidget {
  final TextEditingController controller;
  final String labelName;
  final Function validation;
  const AuthTextFormFeild({
    super.key,
    required this.validation,
    required this.controller,
    required this.labelName,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    keyboardType: textInputType(validation: validation),
    controller: controller,
    validator: (value) {
      return validation(value);
    },
    decoration: InputDecoration(
      labelStyle: const TextStyle(color: Colors.grey),
      labelText: labelName,
      fillColor: Colors.grey.shade200,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
    ),
  );
  }
}

TextInputType? textInputType({required Function validation}) {
    if (validation == validatePhoneNumber) {
      return TextInputType.phone;
    } else if (validation == validateEmail) {
      return TextInputType.emailAddress;
    }
    return null;
  }

String? validatename(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your name';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }

  String pattern = r'^[^@]+@[^@]+\.[^@]+';
  RegExp regex = RegExp(pattern);

  if (!regex.hasMatch(value)) {
    return 'Please enter a valid email';
  }

  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your phone number';
  }

  // Regex pattern for phone number validation (10 digits)
  String pattern = r'^\d{10}$';
  RegExp regex = RegExp(pattern);

  if (!regex.hasMatch(value)) {
    return 'Please enter a valid 10-digit phone number';
  }

  return null;
}
