import '/backend/supabase/supabase.dart';
import '/fit_quest/fit_quest_icon_button.dart';
import '/fit_quest/fit_quest_theme.dart';
import '/fit_quest/fit_quest_util.dart';
import '/fit_quest/fit_quest_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'repte_detail_model.dart';
export 'repte_detail_model.dart';

class RepteDetailWidget extends StatefulWidget {
  const RepteDetailWidget({
    super.key,
    required this.repteId,
  });

  final int? repteId;

  static String routeName = 'RepteDetail';
  static String routePath = '/repteDetail';

  @override
  State<RepteDetailWidget> createState() => _RepteDetailWidgetState();
}

class _RepteDetailWidgetState extends State<RepteDetailWidget> {
  late RepteDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RepteDetailModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ReptesRow>>(
      future: ReptesTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.repteId,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: fit_questTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: SpinKitRipple(
                  color: Color(0xFF5AEF39),
                  size: 100.0,
                ),
              ),
            ),
          );
        }
        List<ReptesRow> repteDetailReptesRowList = snapshot.data!;

        final repteDetailReptesRow = repteDetailReptesRowList.isNotEmpty
            ? repteDetailReptesRowList.first
            : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: fit_questTheme.of(context).secondaryBackground,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              fit_questTheme.of(context).secondaryBackground,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              repteDetailReptesRow!.imatge!,
                            ).image,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              fit_questIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                hoverColor: Color(0x1D000000),
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.safePop();
                                },
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 12.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      repteDetailReptesRow.titol,
                                      'Title',
                                    ),
                                    style: fit_questTheme.of(context)
                                        .headlineMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color: fit_questTheme.of(context)
                                          .primaryBackground,
                                      letterSpacing: 0.0,
                                      shadows: [
                                        Shadow(
                                          color: fit_questTheme.of(context)
                                              .primaryText,
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 2.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'tm0nzcnm' /* Explicació: */,
                                ),
                                style: fit_questTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  repteDetailReptesRow.details,
                                  'Details',
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
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'kmrrj7qa' /* Video demostratiu: */,
                                ),
                                style: fit_questTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: fit_questVideoPlayer(
                                path: valueOrDefault<String>(
                                  repteDetailReptesRow.urlVideo,
                                  'https://v.ftcdn.net/05/80/61/99/700_F_580619965_vtlmNT2QSW2bhekUKdEeVOTMiqHhCV5M_ST.mp4',
                                ),
                                videoType: VideoType.network,
                                height: 520.0,
                                autoPlay: true,
                                looping: true,
                                showControls: true,
                                allowFullScreen: true,
                                allowPlaybackSpeedMenu: false,
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'jgwf7idl' /* Amics que l'han completat: */,
                              ),
                              style: fit_questTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 32.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 12.0),
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: fit_questTheme.of(context).primary,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: fit_questTheme.of(context).accent1,
                              width: 2.0,
                            ),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'kt5zfew2' /* Get Tickets */,
                            ),
                            style: fit_questTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
