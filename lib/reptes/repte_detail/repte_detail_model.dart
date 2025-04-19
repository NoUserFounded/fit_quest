import '/backend/supabase/supabase.dart';
import '/fit_quest/fit_quest_util.dart';
import 'repte_detail_widget.dart' show RepteDetailWidget;
import 'package:flutter/material.dart';

class RepteDetailModel extends fit_questModel<RepteDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in RepteDetail widget.
  List<RepteEstatRow>? friends;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
