import '/backend/supabase/supabase.dart';
import '/fit_quest/fit_quest_util.dart';
import '/profile/friend_request/friend_request_widget.dart';
import '/profile/user_label/user_label_widget.dart';
import 'all_friends_widget.dart' show AllFriendsWidget;
import 'package:flutter/material.dart';

class AllFriendsModel extends fit_questModel<AllFriendsWidget> {
  ///  Local state fields for this page.

  int? friendRequest;

  ///  State fields for stateful widgets in this page.

  // State field(s) for SerachBar widget.
  final serachBarKey = GlobalKey();
  FocusNode? serachBarFocusNode;
  TextEditingController? serachBarTextController;
  String? serachBarSelectedOption;
  String? Function(BuildContext, String?)? serachBarTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in SerachBar widget.
  List<UsuarisRow>? frindInfo;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in SerachBar widget.
  bool? result;
  // Stores action output result for [Backend Call - Insert Row] action in SerachBar widget.
  AmistatsRow? updateTable;
  // Models for userLabel dynamic component.
  late fit_questDynamicModels<UserLabelModel> userLabelModels;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for friendRequest dynamic component.
  late fit_questDynamicModels<FriendRequestModel> friendRequestModels1;
  // Models for friendRequest dynamic component.
  late fit_questDynamicModels<FriendRequestModel> friendRequestModels2;

  @override
  void initState(BuildContext context) {
    userLabelModels = fit_questDynamicModels(() => UserLabelModel());
    friendRequestModels1 = fit_questDynamicModels(() => FriendRequestModel());
    friendRequestModels2 = fit_questDynamicModels(() => FriendRequestModel());
  }

  @override
  void dispose() {
    serachBarFocusNode?.dispose();

    userLabelModels.dispose();
    tabBarController?.dispose();
    friendRequestModels1.dispose();
    friendRequestModels2.dispose();
  }
}
