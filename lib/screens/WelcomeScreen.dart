import 'package:diabetes_tracker/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Theme.of(context).backgroundColor,
      color: Colors.red.shade600,
      showSkipButton: true,
      skip: Text("Skip",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
      skipColor: Colors.purple.shade900,
      onSkip: () {
        Navigator.of(context).pushReplacementNamed(LoginScreen.routename);
      },
      doneColor: Colors.green.shade700,
      isTopSafeArea: true,
      dotsDecorator: DotsDecorator(activeColor: Colors.blue.shade900),
      done: Text("Done",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
      controlsPadding: const EdgeInsets.all(16),
      onDone: () {
        Navigator.of(context).pushReplacementNamed(LoginScreen.routename);
      },
      next: Text(
        "Next",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
      pages: [
        PageViewModel(
            title: "Welcome to DiaBit",
            image: Lottie.asset("assets/lottieFiles/heart2.zip",
                fit: BoxFit.contain),
            body:
                "A personal diabetes tracking app which keeps track of your sugar level "),
        PageViewModel(
            title: "Meet Alex",
            image: Lottie.asset("assets/lottieFiles/doctorApp.zip",
                fit: BoxFit.contain),
            body:
                "Your personal chat bot. It will answer all your questions regarding diabetes"),
        PageViewModel(
            title: "Food AI",
            image: Lottie.asset(
              "assets/lottieFiles/doctor2.zip",
              fit: BoxFit.contain,
              reverse: true,
            ),
            body: "Get real-time analysis of your food"),
        PageViewModel(
            title: "Blood Sugar Loss",
            image: Lottie.asset("assets/lottieFiles/doctor3.zip"),
            body:
                "Instantly create your blood sugar logs and get accurate analysis and stats"),
      ],
    );
  }
}
