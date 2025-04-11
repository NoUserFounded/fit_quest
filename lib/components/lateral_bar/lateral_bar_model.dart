import '/backend/supabase/supabase.dart';
import '/fit_quest/fit_quest_util.dart';
import 'lateral_bar_widget.dart' show LateralBarWidget;
import 'package:flutter/material.dart';

class LateralBarModel extends fit_questModel<LateralBarWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in lateralBar widget.
  List<AmistatsRow>? amistats;
  // Stores action output result for [Custom Action - saveFriendsList] action in lateralBar widget.
  dynamic mevesAmistats;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
