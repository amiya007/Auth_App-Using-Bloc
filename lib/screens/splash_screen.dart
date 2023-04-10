import 'dart:async';

import 'package:auth_app/global.dart';
import 'package:auth_app/screens/home.dart';
import 'package:auth_app/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(
      const Duration(seconds: 5),
      () async {
        if (firebaseAuth.currentUser != null) {
          setState(() {
            getData(firebaseAuth.currentUser!.uid);
            name;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignIn(),
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child: Lottie.asset(
            'assets/lottie files/loading.json',
            frameRate: FrameRate.composition,
          ),
        ),
      ),
    );
  }
}
