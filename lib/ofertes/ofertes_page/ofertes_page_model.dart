import '/fit_quest/fit_quest_util.dart';
import '/fit_quest/form_field_controller.dart';
import 'ofertes_page_widget.dart' show OfertesPageWidget;
import 'package:flutter/material.dart';

class OfertesPageModel extends FlutterFlowModel<OfertesPageWidget> {
  ///  Local state fields for this page.

  String category = 'All';

  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
