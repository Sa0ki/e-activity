import "dart:html";

import "package:flutter/material.dart";
import "package:project/screens/home.dart";
import "package:project/screens/navigator.dart";
import "package:project/services/auth.dart";

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: const Text("Sign in to E-Activity"),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: const Icon(Icons.person, color: Colors.white),
            label: const Text(
              "Register",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Login"),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Enter an email.";
                      return null;
                    },
                    onChanged: (value) {
                      setState(() => email = value);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                      decoration: InputDecoration(labelText: "Password"),
                      onChanged: (value) {
                        setState(() => password = value);
                      },
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Enter a password.";
                        else if (value.length < 6)
                          return "Password must contain at least 6 characters.";
                        return null;
                      }),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[200], //
                    ),
                    child: const Text(
                      "Se connecter",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      dynamic result = await _authService
                          .signInWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() => error =
                            "Could not signed in with those credentials.");
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Nav()),
                        );
                        print("Signed in.");
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    error,
                    style: const TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ))),
    );
  }
}
