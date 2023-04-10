import 'package:auth_app/blocs/sign_in_bloc.dart';
import 'package:auth_app/blocs/sign_up_bloc.dart';
import 'package:auth_app/global.dart';
import 'package:auth_app/screens/home.dart';
import 'package:auth_app/screens/sign_up.dart';
import 'package:auth_app/screens/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authService = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  runApp(MyApp(
    authService: authService,
    firestore: firestore,
  ));
}

class MyApp extends StatelessWidget {
  final FirebaseAuth authService;
  final FirebaseFirestore firestore;

  const MyApp({Key? key, required this.authService, required this.firestore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpBloc>(
          create: (BuildContext context) =>
              SignUpBloc(firebaseAuth: firebaseAuth, firestore: firestore),
        ),
        BlocProvider<SignInBloc>(
          create: ((BuildContext context) {
            return SignInBloc(SignInInitial());
          }),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Authentication',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/splashscreen',
        routes: {
          '/home': (_) => const HomePage(),
          '/signup': (_) => const SignUpForm(),
          '/splashscreen': (_) => const SplashScreen()
        },
      ),
    );
  }
}
