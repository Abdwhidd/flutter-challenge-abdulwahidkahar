import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), (){
      Navigator.pushNamed(context, '/login-page');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            Image.asset('assets/images/header-splash.png'),
            SizedBox(height: 83,),
            Image.asset('assets/images/logo.png',
              width: 120,
              height: 96,
            ),
            SizedBox(height: 83,),
            Image.asset('assets/images/footer-splash.png',
              fit: BoxFit.cover,
              width: 387,
            ),
          ],
        ),
      ),
    );
  }
}