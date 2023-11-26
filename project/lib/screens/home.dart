import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/models/activity.dart';
import 'package:project/services/auth.dart';
import 'package:project/services/database.dart';
import 'package:provider/provider.dart';
import 'package:project/activity-component//activity_list.dart';

class Home extends StatelessWidget {
  final AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Activity>?>.value(
      value: DatabaseService(uid: "").activities,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        body: Container(
          child: ActivityList(),
        ),
      ),
    );
  }
}
