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

Future<double> calculateRatings(List<ValoracionsRow> ratings) async {
  int nRatings = ratings.length;
  double total = 0;

  for (var row in ratings) {
    total += (row.puntuacio ?? 0).toDouble();
  }

  double valoracio = nRatings > 0 ? total / nRatings : 0;
  return valoracio;
}
