import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/lateral_bar/lateral_bar_widget.dart';
import '/fit_quest/fit_quest_theme.dart';
import '/fit_quest/fit_quest_util.dart';
import '/reptes/repte_big_card/repte_big_card_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'reptes_list_model.dart';
export 'reptes_list_model.dart';

class ReptesListWidget extends StatefulWidget {
  const ReptesListWidget({super.key});

  static String routeName = 'ReptesList';
  static String routePath = '/reptesList';

  @override
  State<ReptesListWidget> createState() => _ReptesListWidgetState();
}

class _ReptesListWidgetState extends State<ReptesListWidget> {
  late ReptesListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReptesListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userInfo = await UsuarisTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          currentUserUid,
        ),
      );
      if (_model.userInfo!.length > 0) {
        FFAppState().userInfo = UserStruct(
          username: _model.userInfo?.firstOrNull?.nomUsuari,
          birthday: _model.userInfo?.firstOrNull?.dataNaixement,
          gender: _model.userInfo?.firstOrNull?.genere,
          profilePicture: _model.userInfo?.firstOrNull?.fotoPerfil,
        );
        safeSetState(() {});
        setAppLanguage(context, _model.userInfo!.firstOrNull!.idioma!);
        return;
      } else {
        context.pushNamed(UserInfoWidget.routeName);

        return;
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: fit_questTheme.of(context).secondary,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.lateralBarModel,
            updateCallback: () => safeSetState(() {}),
            child: LateralBarWidget(),
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/Ellipse_66_(1).png',
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 244.0,
                                  fit: BoxFit.cover,
                                ),
                                Image.asset(
                                  'assets/images/Ellipse_69.png',
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 244.0,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 20.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            scaffoldKey.currentState!
                                                .openDrawer();
                                          },
                                          child: Icon(
                                            Icons.dehaze,
                                            color: fit_questTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 25.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'c15grtlr' /* Els meus reptes */,
                                            ),
                                            style: fit_questTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xFF04B974),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: FutureBuilder<List<ReptesRow>>(
                                            future: ReptesTable().queryRows(
                                              queryFn: (q) => q,
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
                                              List<ReptesRow>
                                                  columnReptesRowList =
                                                  snapshot.data!;

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    columnReptesRowList.length,
                                                    (columnIndex) {
                                                  final columnReptesRow =
                                                      columnReptesRowList[
                                                          columnIndex];
                                                  return wrapWithModel(
                                                    model: _model
                                                        .repteBigCardModels
                                                        .getModel(
                                                      columnReptesRow.id
                                                          .toString(),
                                                      columnIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: RepteBigCardWidget(
                                                      key: Key(
                                                        'Key8dh_${columnReptesRow.id.toString()}',
                                                      ),
                                                      repteID:
                                                          columnReptesRow.id,
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
