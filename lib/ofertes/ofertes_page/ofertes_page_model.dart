import '/components/lateral_bar/lateral_bar_widget.dart';
import '/fit_quest/fit_quest_util.dart';
import '/fit_quest/form_field_controller.dart';
import '/ofertes/ofert_card/ofert_card_widget.dart';
import 'ofertes_page_widget.dart' show OfertesPageWidget;
import 'package:flutter/material.dart';

class OfertesPageModel extends fit_questModel<OfertesPageWidget> {
  ///  Local state fields for this page.

  int category = -1;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for ofertCard dynamic component.
  late fit_questDynamicModels<OfertCardModel> ofertCardModels;
  // Model for lateralBar component.
  late LateralBarModel lateralBarModel;

  @override
  void initState(BuildContext context) {
    ofertCardModels = fit_questDynamicModels(() => OfertCardModel());
    lateralBarModel = createModel(context, () => LateralBarModel());
  }

  @override
  void dispose() {
    ofertCardModels.dispose();
    lateralBarModel.dispose();
  }
}
