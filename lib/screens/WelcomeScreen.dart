import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      done: Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      controlsPadding: const EdgeInsets.all(16),
      onDone: () {},
      next: Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
      pages: [
        PageViewModel(
            title: "",
            image: Lottie.asset("assets/lottieFiles/heart2.zip",
                fit: BoxFit.contain),
            body: ""),
        PageViewModel(
            title: "",
            image: Lottie.asset("assets/lottieFiles/doctorApp.zip",
                fit: BoxFit.contain),
            body: ""),
        PageViewModel(
            title: "",
            image:
                Lottie.asset("assets/lottieFiles/doctor2.zip", repeat: false),
            body: ""),
        PageViewModel(
            title: "",
            image: Lottie.asset("assets/lottieFiles/doctor3.zip"),
            body: ""),
      ],
    );
  }
}
