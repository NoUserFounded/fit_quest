import '/fit_quest/fit_quest_util.dart';
import 'all_friends_widget.dart' show AllFriendsWidget;
import 'package:flutter/material.dart';

class AllFriendsModel extends FlutterFlowModel<AllFriendsWidget> {
  ///  Local state fields for this page.

  bool searched = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
