import '/backend/supabase/supabase.dart';
import '/components/share_menu/share_menu_widget.dart';
import '/fit_quest/fit_quest_theme.dart';
import '/fit_quest/fit_quest_util.dart';
import '/fit_quest/fit_quest_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'ofert_card_model.dart';
export 'ofert_card_model.dart';

class OfertCardWidget extends StatefulWidget {
  const OfertCardWidget({
    super.key,
    required this.ofertId,
  });

  final int? ofertId;

  @override
  State<OfertCardWidget> createState() => _OfertCardWidgetState();
}

class _OfertCardWidgetState extends State<OfertCardWidget> {
  late OfertCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OfertCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.ratings = await ValoracionsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id_oferta',
          widget.ofertId,
        ),
      );
      _model.rating = await actions.calculateRatings(
        _model.ratings!.toList(),
      );
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
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
          List<OfertesRow> ofertCardBlockOfertesRowList = snapshot.data!;

          final ofertCardBlockOfertesRow =
              ofertCardBlockOfertesRowList.isNotEmpty
                  ? ofertCardBlockOfertesRowList.first
                  : null;

          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                OfertaWidget.routeName,
                queryParameters: {
                  'ofertId': serializeParam(
                    widget.ofertId,
                    ParamType.int,
                  ),
                  'rating': serializeParam(
                    _model.rating,
                    ParamType.double,
                  ),
                }.withoutNulls,
              );
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: fit_questTheme.of(context).primary,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      0.0,
                      1.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            ofertCardBlockOfertesRow!.urlImatge!,
                            width: 80.0,
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 8.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    ofertCardBlockOfertesRow.title,
                                    'title',
                                  ),
                                  style: fit_questTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFF8FBFB),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                RatingBarIndicator(
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star_rounded,
                                    color:
                                        fit_questTheme.of(context).secondary,
                                  ),
                                  direction: Axis.horizontal,
                                  rating: valueOrDefault<double>(
                                    _model.rating,
                                    0.0,
                                  ),
                                  unratedColor:
                                      fit_questTheme.of(context).tertiary,
                                  itemCount: 5,
                                  itemSize: 24.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.25,
                                    child: ShareMenuWidget(
                                      url:
                                          ofertCardBlockOfertesRow.urlRedirect,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: Icon(
                            Icons.share,
                            color: Color(0xFFF8FBFB),
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          ofertCardBlockOfertesRow.descripcio,
                          'description',
                        ),
                        style:
                            fit_questTheme.of(context).labelMedium.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFF8FBFB),
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: SelectionArea(
                                child: Text(
                              FFLocalizations.of(context).getText(
                                '3h99ce1o' /* Vàlid fins: */,
                              ),
                              style: fit_questTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFF8FBFB),
                                    letterSpacing: 0.0,
                                  ),
                            )),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 8.0, 0.0, 0.0),
                                child: SelectionArea(
                                    child: Text(
                                  dateTimeFormat(
                                    "EEEE, d MMMM H:mm",
                                    ofertCardBlockOfertesRow.finishAt!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: fit_questTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: fit_questTheme.of(context)
                                            .secondary,
                                        letterSpacing: 0.0,
                                      ),
                                )),
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () {
                              print('shareBtn pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'vwyta8ce' /* Valorar */,
                            ),
                            icon: Icon(
                              Icons.star_rate,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: fit_questTheme.of(context).secondary,
                              textStyle: fit_questTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: fit_questTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
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
