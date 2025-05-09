import '/backend/supabase/supabase.dart';
import '/components/info_message/info_message_widget.dart';
import '/components/yes_no_message/yes_no_message_widget.dart';
import '/fit_quest/fit_quest_animations.dart';
import '/fit_quest/fit_quest_theme.dart';
import '/fit_quest/fit_quest_util.dart';
import '/fit_quest/fit_quest_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'friend_request_model.dart';
export 'friend_request_model.dart';

class FriendRequestWidget extends StatefulWidget {
  const FriendRequestWidget({
    super.key,
    required this.solicitud,
    required this.isSended,
  });

  final dynamic solicitud;
  final bool? isSended;

  @override
  State<FriendRequestWidget> createState() => _FriendRequestWidgetState();
}

class _FriendRequestWidgetState extends State<FriendRequestWidget>
    with TickerProviderStateMixin {
  late FriendRequestModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendRequestModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: FutureBuilder<List<UsuarisRow>>(
        future: UsuarisTable().querySingleRow(
          queryFn: (q) => q.eqOrNull(
            'id',
            getJsonField(
              widget.solicitud,
              r'''$.friendId''',
            ).toString(),
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
          List<UsuarisRow> userListUsuarisRowList = snapshot.data!;

          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final userListUsuarisRow = userListUsuarisRowList.isNotEmpty
              ? userListUsuarisRowList.first
              : null;

          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: fit_questTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.0,
                  color: fit_questTheme.of(context).alternate,
                  offset: Offset(
                    0.0,
                    1.0,
                  ),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 44.0,
                        height: 44.0,
                        decoration: BoxDecoration(
                          color: fit_questTheme.of(context).accent1,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: fit_questTheme.of(context).primary,
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                userListUsuarisRow?.fotoPerfil,
                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                              ),
                              width: 60.0,
                              height: 60.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  userListUsuarisRow?.nomUsuari,
                                  'user_name',
                                ),
                                style: fit_questTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 4.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  userListUsuarisRow?.email,
                                  'name@domain.com',
                                ),
                                style: fit_questTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                dateTimeFormat(
                                  "relative",
                                  (getJsonField(
                                    widget.solicitud,
                                    r'''$.createdAt''',
                                  )),
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: fit_questTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Visibility(
                          visible: widget.isSended ?? true,
                          child: Builder(
                            builder: (context) => Padding(
                              padding: EdgeInsets.all(4.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  var _shouldSetState = false;
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: YesNoMessageWidget(
                                          title: 'Cancelar Sol·licitud',
                                          description:
                                              'Segur que vols cancelar la sol·licitud d\'amistat amb \'${userListUsuarisRow?.nomUsuari}\' ?',
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(
                                      () => _model.result = value));

                                  _shouldSetState = true;
                                  if (_model.result!) {
                                    await AmistatsTable().delete(
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'id',
                                        getJsonField(
                                          widget.solicitud,
                                          r'''$.requestId''',
                                        ),
                                      ),
                                    );
                                    FFAppState().removeFromSolicitudEnviades(
                                        widget.solicitud!);
                                    safeSetState(() {});
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: InfoMessageWidget(
                                            title: 'Solicitud cancelada',
                                            description:
                                                'S\'ha cancelat la solicitud d\'amistat amb \'${userListUsuarisRow?.nomUsuari}\' !',
                                            isError: false,
                                          ),
                                        );
                                      },
                                    );

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.cancel,
                                  color: fit_questTheme.of(context)
                                      .secondaryText,
                                  size: 28.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (!widget.isSended!)
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            await AmistatsTable().update(
                              data: {
                                'estat': 'Rebutjada',
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                getJsonField(
                                  widget.solicitud,
                                  r'''$.requestId''',
                                ),
                              ),
                            );
                            FFAppState().removeFromSolicitudsRebudes(
                                widget.solicitud!);
                            safeSetState(() {});
                            Navigator.pop(context);

                            context.pushNamed(AllFriendsWidget.routeName);
                          },
                          text: FFLocalizations.of(context).getText(
                            'lmsu8y4m' /* Rebutjar */,
                          ),
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.35,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: fit_questTheme.of(context).error,
                            textStyle: fit_questTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await AmistatsTable().update(
                              data: {
                                'estat': 'Aceptada',
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                getJsonField(
                                  widget.solicitud,
                                  r'''$.requestId''',
                                ),
                              ),
                            );
                            FFAppState().removeFromSolicitudsRebudes(
                                widget.solicitud!);
                            FFAppState().addToAmistats(<String, dynamic>{
                              'requestId': getJsonField(
                                widget.solicitud,
                                r'''$.requestId''',
                              ),
                              'friendId': getJsonField(
                                widget.solicitud,
                                r'''$.friendId''',
                              ),
                            });
                            safeSetState(() {});
                            Navigator.pop(context);

                            context.pushNamed(AllFriendsWidget.routeName);
                          },
                          text: FFLocalizations.of(context).getText(
                            'knhzu4m1' /* Aceptar */,
                          ),
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.35,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: fit_questTheme.of(context).primary,
                            textStyle: fit_questTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
        },
      ),
    );
  }
}
