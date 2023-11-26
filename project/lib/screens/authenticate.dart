import "package:flutter/material.dart";
import "package:project/screens/authenticate/register.dart";
import "package:project/screens/authenticate/sign_in.dart";

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool signInState = true;
  void toggleView() {
    setState(() => signInState = !signInState);
  }

  @override
  Widget build(BuildContext context) {
    return signInState == true
        ? SignIn(toggleView: toggleView)
        : Register(toggleView: toggleView);
  }
}
