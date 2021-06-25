import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routename = "/loginscreen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FittedBox(
            child: Image.asset("assets/images/splash2.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).buttonColor),
                      padding: MaterialStateProperty.all(EdgeInsets.all(16))),
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
