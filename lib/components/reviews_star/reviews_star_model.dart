import '/fit_quest/fit_quest_util.dart';
import 'reviews_star_widget.dart' show ReviewsStarWidget;
import 'package:flutter/material.dart';

class ReviewsStarModel extends FlutterFlowModel<ReviewsStarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
