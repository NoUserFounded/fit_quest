import '/fit_quest/fit_quest_util.dart';
import '/fit_quest/form_field_controller.dart';
import '/ofertes/review_card/review_card_widget.dart';
import '/reptes/repte_small_card/repte_small_card_widget.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends fit_questModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for LanguageSelector widget.
  String? languageSelectorValue;
  FormFieldController<String>? languageSelectorValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Models for repteSmallCard dynamic component.
  late fit_questDynamicModels<RepteSmallCardModel> repteSmallCardModels;
  // Models for reviewCard dynamic component.
  late fit_questDynamicModels<ReviewCardModel> reviewCardModels;

  @override
  void initState(BuildContext context) {
    repteSmallCardModels =
        fit_questDynamicModels(() => RepteSmallCardModel());
    reviewCardModels = fit_questDynamicModels(() => ReviewCardModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    repteSmallCardModels.dispose();
    reviewCardModels.dispose();
  }
}
