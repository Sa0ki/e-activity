import "package:flutter/material.dart";
import "package:project/screens/ajout.dart";
import "package:project/screens/authenticate.dart";
import "package:project/screens/home.dart";
import "package:project/services/auth.dart";

class Nav extends StatefulWidget {
  Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  AuthService authService = AuthService();
  Color myColor = Colors.white;
  int myIndex = 0;
  List<dynamic> screens = [Home(), Ajout(), Text("Profile")];
  List<String> titles = ["Toutes les activités", "Ajout", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[myIndex]),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          TextButton.icon(
              onPressed: () async {
                print("Signed out.");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Authenticate()),
                );
                return await authService.signOut();
              },
              icon: Icon(Icons.person, color: Colors.white),
              label: Text("Logout", style: TextStyle(color: Colors.white)))
        ],
      ),
      body: screens[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_football), label: "Activités"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Ajout"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
    );
  }
}
