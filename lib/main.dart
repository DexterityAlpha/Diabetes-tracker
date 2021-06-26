import 'package:diabetes_tracker/providers/authentication.dart';
import 'package:diabetes_tracker/screens/LoginScreen.dart';
import 'package:diabetes_tracker/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/WelcomeScreen.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Authentication(),
      child: MaterialApp(
        title: 'DiaBit  ',
        themeMode: ThemeMode.system,
        theme: DiaBitTheme.lightTheme(context),
        darkTheme: DiaBitTheme.darkTheme(context),
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
        routes: {
          LoginScreen.routename: (context) => LoginScreen(),
        },
      ),
    );
  }
}
