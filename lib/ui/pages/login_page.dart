import 'package:app/ui/pages/register_page.dart';
import 'package:app/ui/shared/widgets/custom_button.dart';
import 'package:app/ui/shared/widgets/custom_gesture_detector.dart';
import 'package:app/ui/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'home_page.dart';
import '../viewmodels/bloc_email.dart';
import '../viewmodels/bloc_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();

  void login(String email, String password) async {
    String? storedEmail = await storage.read(key: "email");
    String? storedPassword = await storage.read(key: "password");

    if (storedEmail == null || storedEmail != email) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(milliseconds: 400),
          content: Text('User not found!')));
    } else if (storedPassword == password && storedEmail == email) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else if (storedPassword == null || storedPassword != password) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(milliseconds: 400),
          content: Text('Incorrect password!')));
    }
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
                          "Login",
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
                        child: Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomTextFormFieldEmail("E-mail", Icons.email,
                                  emailController, TextInputType.emailAddress),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextFormFieldPassword(
                                  "Password",
                                  Icons.lock,
                                  passwordController,
                                  TextInputType.visiblePassword),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              CustomButton(
                                onPressed: (email, password) {
                                  login(email,
                                      password); // Call register() with email and password
                                },
                                text: 'Sign in',
                                emailController: emailController,
                                passwordController: passwordController,
                                formKey: _formKey,
                              ),
                              // CustomButton(() => login(), "Sign in", passwordController, emailController, _formKey),
                              const SizedBox(
                                height: 20,
                              ),
                              const CustomGestureDetector(
                                  "or sign up", RegistrationPage())
                            ],
                          ),
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
