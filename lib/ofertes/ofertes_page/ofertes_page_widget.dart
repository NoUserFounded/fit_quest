import '/backend/supabase/supabase.dart';
import '/components/lateral_bar/lateral_bar_widget.dart';
import '/fit_quest/fit_quest_choice_chips.dart';
import '/fit_quest/fit_quest_theme.dart';
import '/fit_quest/fit_quest_util.dart';
import '/fit_quest/form_field_controller.dart';
import '/ofertes/ofert_card/ofert_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'ofertes_page_model.dart';
export 'ofertes_page_model.dart';

class OfertesPageWidget extends StatefulWidget {
  const OfertesPageWidget({super.key});

  static String routeName = 'OfertesPage';
  static String routePath = '/ofertesPage';

  @override
  State<OfertesPageWidget> createState() => _OfertesPageWidgetState();
}

class _OfertesPageWidgetState extends State<OfertesPageWidget> {
  late OfertesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OfertesPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 25.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              scaffoldKey.currentState!.openDrawer();
                            },
                            child: Icon(
                              Icons.dehaze,
                              color: fit_questTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 40.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '5a2m9864' /* Ofertes */,
                                ),
                                textAlign: TextAlign.start,
                                style: fit_questTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF04B974),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 120.0)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: FutureBuilder<List<OfertesCategoriesRow>>(
                                future: OfertesCategoriesTable().queryRows(
                                  queryFn: (q) =>
                                      q.order('id', ascending: true),
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
                                  List<OfertesCategoriesRow>
                                      choiceChipsOfertesCategoriesRowList =
                                      snapshot.data!;

                                  return fit_questChoiceChips(
                                    options: choiceChipsOfertesCategoriesRowList
                                        .map((e) => e.nom)
                                        .toList()
                                        .map((label) => ChipData(label))
                                        .toList(),
                                    onChanged: (val) async {
                                      safeSetState(() => _model
                                          .choiceChipsValue = val?.firstOrNull);
                                      _model.category =
                                          choiceChipsOfertesCategoriesRowList
                                              .where((e) =>
                                                  e.nom ==
                                                  _model.choiceChipsValue)
                                              .toList()
                                              .firstOrNull!
                                              .id;
                                      safeSetState(() {});
                                    },
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          fit_questTheme.of(context).primary,
                                      textStyle: fit_questTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      iconColor: fit_questTheme.of(context)
                                          .primaryText,
                                      iconSize: 18.0,
                                      elevation: 4.0,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          fit_questTheme.of(context).tertiary,
                                      textStyle: fit_questTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: fit_questTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      iconColor: fit_questTheme.of(context)
                                          .secondaryText,
                                      iconSize: 18.0,
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    chipSpacing: 12.0,
                                    rowSpacing: 12.0,
                                    multiselect: false,
                                    initialized:
                                        _model.choiceChipsValue != null,
                                    alignment: WrapAlignment.start,
                                    controller:
                                        _model.choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                      [
                                        choiceChipsOfertesCategoriesRowList
                                            .firstOrNull!.nom
                                      ],
                                    ),
                                    wrapped: true,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: FutureBuilder<List<OfertesRow>>(
                        future: OfertesTable().queryRows(
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
                          List<OfertesRow> ofertsListOfertesRowList =
                              snapshot.data!;

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                                  List.generate(ofertsListOfertesRowList.length,
                                      (ofertsListIndex) {
                                final ofertsListOfertesRow =
                                    ofertsListOfertesRowList[ofertsListIndex];
                                return Visibility(
                                  visible: (ofertsListOfertesRow.idCategoria ==
                                          _model.category) ||
                                      (_model.category == 0),
                                  child: wrapWithModel(
                                    model: _model.ofertCardModels.getModel(
                                      ofertsListOfertesRow.id.toString(),
                                      ofertsListIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: OfertCardWidget(
                                      key: Key(
                                        'Keypoy_${ofertsListOfertesRow.id.toString()}',
                                      ),
                                      ofertId: ofertsListOfertesRow.id,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        },
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
  }
}
