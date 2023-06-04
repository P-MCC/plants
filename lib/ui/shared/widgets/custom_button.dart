import 'package:app/ui/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function(String, String)? onPressed;
  final String text;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> _formKey;

  const CustomButton({
    required this.onPressed,
    required this.text,
    required this.emailController,
    required this.passwordController,
    required GlobalKey<FormState> formKey,
    Key? key,
  })  : _formKey = formKey,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() == true) {
          final email = emailController.text;
          final password = passwordController.text;
          onPressed!(email, password); // Call onPressed with email and password
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please fill in valid email and password')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: kButtonBackgroundColor,
        textStyle: const TextStyle(fontSize: kFontSize),
        fixedSize: kCustomButtonFixedSize,
      ),
      child: Text(text),
    );
  }
}


