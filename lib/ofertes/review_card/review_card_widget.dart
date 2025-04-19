import '/backend/supabase/supabase.dart';
import '/fit_quest/fit_quest_theme.dart';
import '/fit_quest/fit_quest_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'review_card_model.dart';
export 'review_card_model.dart';

class ReviewCardWidget extends StatefulWidget {
  const ReviewCardWidget({
    super.key,
    required this.ofertId,
    required this.comentari,
    required this.createdAt,
    required this.rating,
  });

  final int? ofertId;
  final String? comentari;
  final DateTime? createdAt;
  final double? rating;

  @override
  State<ReviewCardWidget> createState() => _ReviewCardWidgetState();
}

class _ReviewCardWidgetState extends State<ReviewCardWidget> {
  late ReviewCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
      child: FutureBuilder<List<OfertesRow>>(
        future: OfertesTable().querySingleRow(
          queryFn: (q) => q.eqOrNull(
            'Id',
            widget.ofertId,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: SpinKitRipple(
                  color: Color(0xFF5AEF39),
                  size: 100.0,
                ),
              ),
            );
          }
          List<OfertesRow> containerOfertesRowList = snapshot.data!;

          final containerOfertesRow = containerOfertesRowList.isNotEmpty
              ? containerOfertesRowList.first
              : null;

          return Material(
            color: Colors.transparent,
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              width: double.infinity,
              height: 100.0,
              decoration: BoxDecoration(
                color: fit_questTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: fit_questTheme.of(context)
                                .secondaryBackground,
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.network(
                              containerOfertesRow!.urlImatge!,
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          containerOfertesRow.title,
                                          'Title',
                                        ),
                                        style: fit_questTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      RatingBarIndicator(
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: fit_questTheme.of(context)
                                              .primary,
                                        ),
                                        direction: Axis.horizontal,
                                        rating: widget.rating!,
                                        unratedColor:
                                            fit_questTheme.of(context)
                                                .accent1,
                                        itemCount: 5,
                                        itemSize: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                dateTimeFormat(
                                  "d/M H:mm",
                                  widget.createdAt,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: fit_questTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 9.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.comentari,
                            'Comentari',
                          ),
                          style:
                              fit_questTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
