import 'package:ass3/help.dart';
import 'package:ass3/home.dart';
import 'package:ass3/login.dart';
import 'package:ass3/profile.dart';
import 'package:ass3/register.dart';
import 'package:ass3/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assessment 3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      // home: RegisterPage(),

      initialRoute: '/',

      routes: {
        '/': (context) => WelcomePage(),
        '/RegisterPage':(context) => RegisterPage(),
        '/LoginPage': (context) => LoginPage(),
        '/HomePage': (context) => HomePage(),
        '/ProfilePage': (context) => ProfilePage(),
        '/HelpPage': (context) => HelpPage(),
      },
    );
  }
}
