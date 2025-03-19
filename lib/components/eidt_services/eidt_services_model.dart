import '/fit_quest/fit_quest_util.dart';
import '/fit_quest/form_field_controller.dart';
import 'eidt_services_widget.dart' show EidtServicesWidget;
import 'package:flutter/material.dart';

class EidtServicesModel extends FlutterFlowModel<EidtServicesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
