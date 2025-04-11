import '/backend/supabase/supabase.dart';
import '/fit_quest/fit_quest_util.dart';
import 'ofert_card_widget.dart' show OfertCardWidget;
import 'package:flutter/material.dart';

class OfertCardModel extends fit_questModel<OfertCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in ofertCard widget.
  List<ValoracionsRow>? ratings;
  // Stores action output result for [Custom Action - calculateRatings] action in ofertCard widget.
  double? rating;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
