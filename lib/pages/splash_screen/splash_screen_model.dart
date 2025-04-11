import '/backend/supabase/supabase.dart';
import '/fit_quest/fit_quest_util.dart';
import '/index.dart';
import 'splash_screen_widget.dart' show SplashScreenWidget;
import 'package:flutter/material.dart';

class SplashScreenModel extends fit_questModel<SplashScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in SplashScreen widget.
  List<AmistatsRow>? amistats;
  // Stores action output result for [Custom Action - saveFriendsList] action in SplashScreen widget.
  dynamic mevesAmistats;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
