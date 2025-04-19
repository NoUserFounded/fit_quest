import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/fit_quest/fit_quest_theme.dart';
import '/fit_quest/fit_quest_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'repte_big_card_model.dart';
export 'repte_big_card_model.dart';

class RepteBigCardWidget extends StatefulWidget {
  const RepteBigCardWidget({
    super.key,
    required this.repteID,
  });

  final int? repteID;

  @override
  State<RepteBigCardWidget> createState() => _RepteBigCardWidgetState();
}

class _RepteBigCardWidgetState extends State<RepteBigCardWidget> {
  late RepteBigCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RepteBigCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: FutureBuilder<List<ReptesRow>>(
        future: ReptesTable().querySingleRow(
          queryFn: (q) => q.eqOrNull(
            'id',
            widget.repteID,
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
          List<ReptesRow> cardActionsReptesRowList = snapshot.data!;

          final cardActionsReptesRow = cardActionsReptesRowList.isNotEmpty
              ? cardActionsReptesRowList.first
              : null;

          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                RepteDetailWidget.routeName,
                queryParameters: {
                  'repteId': serializeParam(
                    widget.repteID,
                    ParamType.int,
                  ),
                }.withoutNulls,
              );
            },
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 770.0,
              ),
              decoration: BoxDecoration(
                color: fit_questTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7.0,
                    color: Color(0x2F1D2429),
                    offset: Offset(
                      0.0,
                      3.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.network(
                        cardActionsReptesRow!.imatge!,
                        width: double.infinity,
                        height: 83.8,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              cardActionsReptesRow.titol,
                              'Title',
                            ),
                            style: fit_questTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FutureBuilder<List<RepteCategoriesRow>>(
                            future: RepteCategoriesTable().querySingleRow(
                              queryFn: (q) => q.eqOrNull(
                                'id',
                                cardActionsReptesRow.categoryId,
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
                              List<RepteCategoriesRow>
                                  textRepteCategoriesRowList = snapshot.data!;

                              final textRepteCategoriesRow =
                                  textRepteCategoriesRowList.isNotEmpty
                                      ? textRepteCategoriesRowList.first
                                      : null;

                              return Text(
                                valueOrDefault<String>(
                                  textRepteCategoriesRow?.displayname,
                                  'Category',
                                ),
                                style: fit_questTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: colorFromCssString(
                                        textRepteCategoriesRow!.color,
                                        defaultColor:
                                            fit_questTheme.of(context).info,
                                      ),
                                      letterSpacing: 0.0,
                                    ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Text(
                              valueOrDefault<String>(
                                cardActionsReptesRow.descripcio,
                                'Description',
                              ),
                              style: fit_questTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: fit_questTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  Text(
                                    '${valueOrDefault<String>(
                                      cardActionsReptesRow.duracio?.toString(),
                                      '0',
                                    )}\'',
                                    style: fit_questTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 5.0)),
                              ),
                            ),
                          ),
                          FutureBuilder<List<RepteEstatRow>>(
                            future: RepteEstatTable().querySingleRow(
                              queryFn: (q) => q
                                  .eqOrNull(
                                    'id_repte',
                                    widget.repteID,
                                  )
                                  .eqOrNull(
                                    'id_usuari',
                                    currentUserUid,
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
                              List<RepteEstatRow> statusRepteEstatRowList =
                                  snapshot.data!;

                              final statusRepteEstatRow =
                                  statusRepteEstatRowList.isNotEmpty
                                      ? statusRepteEstatRowList.first
                                      : null;

                              return Container(
                                width: MediaQuery.sizeOf(context).width * 0.3,
                                height: 35.0,
                                decoration: BoxDecoration(
                                  color: fit_questTheme.of(context).accent3,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (statusRepteEstatRow?.status ==
                                              'Fallit') {
                                            return Icon(
                                              Icons.assignment_late,
                                              color:
                                                  fit_questTheme.of(context)
                                                      .error,
                                              size: 24.0,
                                            );
                                          } else if (statusRepteEstatRow
                                                  ?.status ==
                                              'En proces') {
                                            return Icon(
                                              Icons.auto_mode,
                                              color: Color(0xFFDF823F),
                                              size: 24.0,
                                            );
                                          } else if (statusRepteEstatRow
                                                  ?.status ==
                                              'Completat') {
                                            return Icon(
                                              Icons.offline_pin,
                                              color:
                                                  fit_questTheme.of(context)
                                                      .success,
                                              size: 24.0,
                                            );
                                          } else {
                                            return Icon(
                                              Icons.pending_sharp,
                                              color:
                                                  fit_questTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            );
                                          }
                                        },
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          statusRepteEstatRow?.status,
                                          'Pendent',
                                        ),
                                        style: fit_questTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: () {
                                                if (statusRepteEstatRow
                                                        ?.status ==
                                                    'Fallit') {
                                                  return fit_questTheme.of(
                                                          context)
                                                      .error;
                                                } else if (statusRepteEstatRow
                                                        ?.status ==
                                                    'Completat') {
                                                  return fit_questTheme.of(
                                                          context)
                                                      .success;
                                                } else if (statusRepteEstatRow
                                                        ?.status ==
                                                    'En proces') {
                                                  return Color(0xFFDF823F);
                                                } else {
                                                  return fit_questTheme.of(
                                                          context)
                                                      .primaryText;
                                                }
                                              }(),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
                                  ),
                                ),
                              );
                            },
                          ),
                        ].divide(SizedBox(width: 10.0)),
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
