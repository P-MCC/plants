import 'package:app/ui/shared/utils/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../viewmodels/bloc_email.dart';
import '../../viewmodels/bloc_password.dart';

class CustomTextFormFieldEmail extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyboardType;

  CustomTextFormFieldEmail(
      this.hintText, this.icon, this.controller, this.keyboardType,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kSize),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: kfillColor,
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: kIconColor,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an email address';
        }
        if (!EmailValidator.validate(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      onChanged: (value) {
        context.read<EmailBloc>().add(value);
      },
    );
  }
}

class CustomTextFormFieldPassword extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const CustomTextFormFieldPassword(
      this.hintText, this.icon, this.controller, this.keyboardType,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kSize),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: kfillColor,
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: kIconColor,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        if (!value.contains(RegExp(r'[A-Z]'))) {
          return 'Password must contain at least one uppercase letter';
        }
        return null;
      },
      onChanged: (value) {
        context.read<PasswordBloc>().add(value);
      },
    );

  }
}
