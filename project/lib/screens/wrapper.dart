import "dart:js";

import "package:flutter/material.dart";
import "package:project/models/user.dart";
import "package:project/screens/authenticate.dart";
import "package:project/screens/home.dart";
import "package:provider/provider.dart";
import "package:project/screens/navigator.dart";

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    return user == null ? Authenticate() : Nav();
  }
}
