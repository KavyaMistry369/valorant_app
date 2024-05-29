import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  myTimer() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      Navigator.of(context).pushReplacementNamed(Routes.homePage);
    });
  }

  @override
  void initState() {
    super.initState();
    myTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Transform.scale(
            scale: 1.3,
              child: Opacity(
                opacity: 0.5,
                  child: Image.asset("assets/images/main.jpg"))),
          Image.asset("assets/images/logo.png",width: 250,),
        ],
      ),
    );
  }
}
