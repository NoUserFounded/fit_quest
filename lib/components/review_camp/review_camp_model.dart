import '/fit_quest/fit_quest_util.dart';
import 'review_camp_widget.dart' show ReviewCampWidget;
import 'package:flutter/material.dart';

class ReviewCampModel extends FlutterFlowModel<ReviewCampWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
