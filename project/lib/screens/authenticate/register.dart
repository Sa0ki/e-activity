import "package:flutter/material.dart";
import "package:project/screens/home.dart";
import "package:project/screens/navigator.dart";

import "../../services/auth.dart";

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({super.key, required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: const Text("Sign up to E-Activity"),
        actions: <Widget>[
          TextButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: const Icon(Icons.person, color: Colors.white),
              label: const Text(
                "Sign In",
                style: TextStyle(color: Colors.white),
              )),
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
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Enter a password.";
                      else if (value.length < 6)
                        return "Password must contain at least 6 characters.";
                      return null;
                    },
                    onChanged: (value) {
                      setState(() => password = value);
                    },
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[200], //
                    ),
                    child: const Text(
                      "S'inscrire",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState?.validate() != null) {
                        dynamic result = await _authService
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() => error = "Please enter a valid email.");
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Nav()),
                          );
                          print("Registered.");
                        }
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
