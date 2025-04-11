// Automatic fit_quest imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/fit_quest/fit_quest_theme.dart';
import '/fit_quest/fit_quest_util.dart';
import 'index.dart'; // Imports other custom actions
import '/fit_quest/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

Future<dynamic> saveFriendsList(
  List<AmistatsRow>? query,
  String? userID,
) async {
  List<Map<String, dynamic>> amistats = [];
  List<Map<String, dynamic>> solicitudsEnviades = [];
  List<Map<String, dynamic>> solicitudsRebudes = [];

  if (query != null && userID != null) {
    for (var row in query) {
      String currentUser = row.usuari;
      switch (row.estat) {
        case "Aceptada":
          amistats.add({
            "requestId": row.id,
            "friendId": currentUser == userID ? row.amic : currentUser,
          });
          break;
        case "En proces":
          if (currentUser == userID) {
            solicitudsEnviades.add({
              "requestId": row.id,
              "friendId": row.amic,
              "createdAt": row.createdAt,
            });
          } else {
            solicitudsRebudes.add({
              "requestId": row.id,
              "friendId": currentUser,
              "createdAt": row.createdAt,
            });
          }
          break;
      }
    }
  }

  Map<String, dynamic> values = {
    "amistats": amistats,
    "solicituds": {
      "enviades": solicitudsEnviades,
      "rebudes": solicitudsRebudes,
    }
  };

  return values;
}
