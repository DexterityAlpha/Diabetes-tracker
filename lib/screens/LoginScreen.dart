import 'package:diabetes_tracker/pages/HomePage.dart';
import 'package:diabetes_tracker/providers/authentication.dart';
import 'package:flutter/material.dart';

// It's broken I guess due to some file name issue . Just Fuck it
class LoginScreen extends StatelessWidget {
  static const routename = "/loginscreen";
  void initState() {
    Authentication().initAction();
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var login = Provider.of<Authentication>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FittedBox(
            child: Image.asset("assets/images/splash3.png"),
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
                  onPressed: () async {
                    Navigator.of(context)
                        .pushReplacementNamed(HomePage.routname);
                  },
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
