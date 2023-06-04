import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'ui/pages/login_page.dart';
import 'ui/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkUserLoggedIn(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && snapshot.data!) {
          return const MaterialApp(
            home: HomePage(),
          );
        } else {
          return const MaterialApp(
            home: LoginPage(),
          );
        }
      },
    );
  }

  Future<bool> checkUserLoggedIn() async {
    const storage = FlutterSecureStorage();
    final email = await storage.read(key: 'email');
    final password = await storage.read(key: 'password');

    return email != null && password != null;
  }
}
