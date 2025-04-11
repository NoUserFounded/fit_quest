import '/fit_quest/fit_quest_util.dart';
import 'receptes_widget.dart' show ReceptesWidget;
import 'package:flutter/material.dart';

class ReceptesModel extends fit_questModel<ReceptesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
