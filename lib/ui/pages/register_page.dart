import 'package:app/ui/pages/login_page.dart';
import 'package:app/ui/shared/widgets/custom_button.dart';
import 'package:app/ui/shared/widgets/custom_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../shared/widgets/custom_text_field.dart';
import '../viewmodels/bloc_email.dart';
import '../viewmodels/bloc_password.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();
  void register(String email, String password) async {
    await storage.write(key: "email", value: email);
    await storage.write(key: "password", value: password);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(milliseconds: 600),
        content: Text(
            'Registration Successfully! You must sign in!'))); // new widget for Flutter 2.0
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<EmailBloc>(create: (_) => EmailBloc()),
          BlocProvider<PasswordBloc>(create: (_) => PasswordBloc()),
        ],
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blue,
                Colors.red,
              ], begin: Alignment.topLeft, end: Alignment.topRight),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white, fontSize: 46),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Form(
                    key: _formKey,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextFormFieldEmail("E-mail",Icons.email, emailController,  TextInputType.emailAddress),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormFieldPassword("Password", Icons.lock, passwordController, TextInputType.visiblePassword),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              onPressed: (email, password) {
                                register(email, password); // Call register() with email and password
                                // Perform login
                                // ...
                              },
                              text: 'Log in',
                              emailController: emailController,
                              passwordController: passwordController,
                              formKey: _formKey,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const CustomGestureDetector("sign in", LoginPage())
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
