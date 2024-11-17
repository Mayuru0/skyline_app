import 'package:flutter/material.dart';
import 'package:skyline/screens/home_screen.dart';
import 'package:skyline/screens/login_screen.dart';
import 'package:skyline/screens/register_screen.dart';
import 'package:skyline/screens/welcome_screen.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        
      },
      
    );
  }
}
