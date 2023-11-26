import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/activity-component//activity_tile.dart';
import 'package:project/models/activity.dart';
import 'package:provider/provider.dart';

class ActivityList extends StatefulWidget {
  const ActivityList({Key? key}) : super(key: key);

  @override
  State<ActivityList> createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  String selectedCategory = "Tous"; // Catégorie par défaut

  @override
  Widget build(BuildContext context) {
    final activities = Provider.of<List<Activity>?>(context);

    if (activities == null || activities.isEmpty) {
      return Container();
    }

    // Filtrer et trier les activités en fonction de la catégorie sélectionnée
    List<Activity> filteredActivities = activities
        .where((activity) =>
            selectedCategory == "Tous" ||
            activity.categorie == selectedCategory)
        .toList();

    // Trier la liste filtrée par catégories
    filteredActivities.sort((a, b) => a.titre.compareTo(b.titre));

    return Column(
      children: [
        // Barre d'onglets pour sélectionner la catégorie
        DefaultTabController(
          length: 3, // Trois onglets (Tous, Sport, Autre)
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: "Tous"),
                  Tab(text: "Sport"),
                  Tab(text: "Driving"),
                ],
                onTap: (index) {
                  // Mettre à jour la catégorie sélectionnée lorsque l'utilisateur sélectionne un onglet
                  setState(() {
                    if (index == 0) {
                      selectedCategory = "Tous";
                    } else if (index == 1) {
                      selectedCategory = "sport";
                    } else if (index == 2) {
                      selectedCategory = "driving";
                    }
                  });
                },
              ),
            ],
          ),
        ),
        // Liste des activités filtrées et triées
        Expanded(
          child: ListView.builder(
            itemCount: filteredActivities.length,
            itemBuilder: (context, index) {
              return ActivityTile(activity: filteredActivities[index]);
            },
          ),
        ),
      ],
    );
  }
}
