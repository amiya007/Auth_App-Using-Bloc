import 'package:auth_app/screens/splash_screen.dart';

import '../global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String userName = '';
  @override
  void initState() {
    setState(() {
      getData(firebaseAuth.currentUser!.uid);
      name;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await firebaseAuth.signOut().then(
                    (value) => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const SplashScreen(),
                      ),
                    ),
                  );
            },
            icon: const Icon(
              Icons.logout_rounded,
              color: Colors.black,
            ),
          ),
        ],
        title: Text(
          'Home',
          style: myTextStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            //Welcome
            Lottie.asset(
              'assets/lottie files/welcome.json',
              animate: true,
            ),
            const SizedBox(height: 20),
            Text.rich(
              TextSpan(
                text: 'Hello ',
                style: const TextStyle(
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text: '$name !',
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  const TextSpan(
                    text: '\nWelcome ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: auth.currentUser!.email,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
