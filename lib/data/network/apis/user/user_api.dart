import 'dart:async';

import 'package:github_ntf/data/network/constants/endpoints.dart';
import 'package:github_ntf/data/network/dio_client.dart';
import 'package:github_ntf/data/network/rest_client.dart';
import 'package:github_ntf/models/repo/repo_list.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  final databaseReference = Firestore.instance;

  UserApi();

  Future<String> getUserId() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString("USER_ID");
  }

  Future like(int repoId) async {
    databaseReference
        .collection("users")
        .document("1")
        .collection("favs")
        .getDocuments()
        .then((snapshot) => {
              if (snapshot.documents.length > 0)
                {
                  for (var doc in snapshot.documents) {doc.data}
                }
            });
  }
}
