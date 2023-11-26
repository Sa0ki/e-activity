import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:project/models/activity.dart';
import 'package:tflite/tflite.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference activityCollection =
      FirebaseFirestore.instance.collection("activities");

  Future addActivity(String imageUrl, String categorie, String titre,
      String lieu, int nombreDePersonneMin, double prix) async {
    return await activityCollection.doc(uid).set({
      "image": imageUrl,
      "titre": titre,
      "categorie": categorie,
      "lieu": lieu,
      "nombre_de_personnes_min": nombreDePersonneMin,
      "prix": prix
    }, null);
  }

  List<Activity>? _activityListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Activity(
          image: doc.get("image") ?? "",
          titre: doc.get("titre") ?? "",
          categorie: doc.get("categorie") ?? "",
          lieu: doc.get("lieu") ?? "",
          nombreDePersonnesMin: doc.get("nombre_de_personnes_min") ?? 0,
          prix: doc.get("prix") ?? 0.0);
    }).toList();
  }

  Stream<List<Activity>?> get activities {
    return activityCollection.snapshots().map(_activityListFromSnapShot);
  }
}
