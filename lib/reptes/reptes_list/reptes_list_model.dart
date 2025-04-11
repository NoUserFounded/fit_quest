import '/backend/supabase/supabase.dart';
import '/components/lateral_bar/lateral_bar_widget.dart';
import '/fit_quest/fit_quest_util.dart';
import '/reptes/repte_card/repte_card_widget.dart';
import '/index.dart';
import 'reptes_list_widget.dart' show ReptesListWidget;
import 'package:flutter/material.dart';

class ReptesListModel extends fit_questModel<ReptesListWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ReptesList widget.
  List<UsuarisRow>? userInfo;
  // Models for repteCard dynamic component.
  late fit_questDynamicModels<RepteCardModel> repteCardModels;
  // Model for lateralBar component.
  late LateralBarModel lateralBarModel;

  @override
  void initState(BuildContext context) {
    repteCardModels = fit_questDynamicModels(() => RepteCardModel());
    lateralBarModel = createModel(context, () => LateralBarModel());
  }

  @override
  void dispose() {
    repteCardModels.dispose();
    lateralBarModel.dispose();
  }
}
