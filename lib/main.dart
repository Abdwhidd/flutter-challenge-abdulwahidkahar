import 'package:flutter/material.dart';
import 'package:flutter_challenge/pages/login_page.dart';
import 'package:flutter_challenge/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => SplashPage(),
        '/login-page' : (context) => LoginPage(),
      },
    );
  }
}

