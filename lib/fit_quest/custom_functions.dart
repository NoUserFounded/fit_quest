import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

double? calculatePercentatge(
  double percentatge,
  double? preu,
) {
  // calculate the percetatge of price
  if (preu == null) return null; // Return null if price is null
  return (percentatge / 100) * preu; // Calculate percentage of price
}
