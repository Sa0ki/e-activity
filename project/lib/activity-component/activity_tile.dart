import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project/activity-component//activity_detail.dart';
import 'package:project/models/activity.dart';

class ActivityTile extends StatelessWidget {
  final Activity activity;
  ActivityTile({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: InkWell(
        onTap: () {
          // Lorsque la ligne est cliquée, naviguez vers les détails de l'activité
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ActivityDetail(activity: activity)),
          );
        },
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: SizedBox(
              width: 56.0,
              height: 56.0,
              child: Image.network(
                activity.image,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(activity.titre + " - " + activity.lieu),
            subtitle: Text("${activity.prix}€ / Heure"),
          ),
        ),
      ),
    );
  }
}
