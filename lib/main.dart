import 'package:flutter/material.dart';
import 'screens/WelcomeScreen.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DiaBit  ',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
