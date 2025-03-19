import '/components/reviews_star/reviews_star_widget.dart';
import '/fit_quest/fit_quest_util.dart';
import '/fit_quest/form_field_controller.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for reviewsStar component.
  late ReviewsStarModel reviewsStarModel;

  @override
  void initState(BuildContext context) {
    reviewsStarModel = createModel(context, () => ReviewsStarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    reviewsStarModel.dispose();
  }
}
