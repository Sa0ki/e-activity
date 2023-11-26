import "package:flutter/material.dart";
import "package:project/screens/navigator.dart";
import "package:project/services/auth.dart";
import "package:project/services/database.dart";
import "package:uuid/uuid.dart";
import "package:project/services/iaService.dart";

class Ajout extends StatefulWidget {
  const Ajout({Key? key}) : super(key: key);

  @override
  State<Ajout> createState() => _State();
}

class _State extends State<Ajout> {
  AuthService authService = AuthService();
  String titre = "";
  String lieu = "";
  int nombreDePersonnesMin = 0;
  double prix = 0.0;
  String image = "";
  String categorie = "";
  double height = 15.0;

  // Use a TextEditingController for the category field
  TextEditingController categorieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: height),
              TextFormField(
                decoration: InputDecoration(labelText: "Titre"),
                onChanged: (value) {
                  setState(() {
                    titre = value;
                  });
                },
              ),
              SizedBox(height: height),
              TextFormField(
                decoration: InputDecoration(labelText: "Lieu"),
                onChanged: (value) {
                  setState(() {
                    lieu = value;
                  });
                },
              ),
              SizedBox(height: height),
              TextFormField(
                decoration:
                    InputDecoration(labelText: "Nombre de personnes (minimum)"),
                onChanged: (value) {
                  setState(() {
                    nombreDePersonnesMin = int.parse(value);
                  });
                },
              ),
              SizedBox(height: height),
              TextFormField(
                decoration: InputDecoration(labelText: "Prix"),
                onChanged: (value) {
                  setState(() {
                    prix = double.parse(value);
                  });
                },
              ),
              SizedBox(height: height),
              TextFormField(
                decoration: InputDecoration(labelText: "Image (url)"),
                onChanged: (value) async {
                  setState(() {
                    image = value;
                  });
                  if (image.isNotEmpty) {
                    categorie = await traiterImage(image);
                    // Set the value of the category field using the controller
                    categorieController.text = categorie;
                  }
                },
              ),
              SizedBox(height: height),
              TextFormField(
                decoration: InputDecoration(labelText: "Catégorie"),
                onChanged: (value) {},
                enabled: false,
                controller: categorieController, // Use the controller here
              ),
              SizedBox(height: height + 15.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[200], //
                ),
                child: const Text(
                  "Valider",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  String? email = authService.getUserEmail();
                  if (email != null) {
                    DatabaseService(uid: email + Uuid().v4()).addActivity(
                      image,
                      categorie,
                      titre,
                      lieu,
                      nombreDePersonnesMin,
                      prix,
                    );
                    print(
                        "L'activité de l'utilisateur '${email}' a été ajoutée.");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Nav()),
                    );
                  } else {
                    print("L'activité n'a pas pu être ajouté.");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
