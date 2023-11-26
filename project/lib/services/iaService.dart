import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> traiterImage(String data) async {
  var url = 'http://localhost:5000/predict';
  var body = {"url": data};
  try {
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      String category = decodedResponse['category'];
      print("Category: $category");
      return category;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    print('Error occurred: $e');
  }
  return "other";
}
