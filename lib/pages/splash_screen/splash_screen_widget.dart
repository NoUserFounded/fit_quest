import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/fit_quest/fit_quest_theme.dart';
import '/fit_quest/fit_quest_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'splash_screen_model.dart';
export 'splash_screen_model.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  static String routeName = 'SplashScreen';
  static String routePath = '/splashScreen';

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  late SplashScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (currentUserUid != '') {
        _model.amistats = await AmistatsTable().queryRows(
          queryFn: (q) =>
              q.or("usuari.eq.${currentUserUid}, amic.eq.${currentUserUid}"),
        );
        _model.mevesAmistats = await actions.saveFriendsList(
          _model.amistats?.toList(),
          currentUserUid,
        );
        FFAppState().solicitudEnviades = getJsonField(
          _model.mevesAmistats,
          r'''$.solicituds.enviades''',
          true,
        )!
            .toList()
            .cast<dynamic>();
        FFAppState().solicitudsRebudes = getJsonField(
          _model.mevesAmistats,
          r'''$.solicituds.rebudes''',
          true,
        )!
            .toList()
            .cast<dynamic>();
        FFAppState().amistats = getJsonField(
          _model.mevesAmistats,
          r'''$.amistats''',
          true,
        )!
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
        await Future.delayed(const Duration(milliseconds: 1000));

        context.pushNamed(ReptesListWidget.routeName);

        return;
      } else {
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
        backgroundColor: fit_questTheme.of(context).alternate,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: fit_questTheme.of(context).primaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -0.95),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.219,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.94),
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/DALLE_2025-02-17_09.52.12_-_A_modern_and_dynamic_logo_for_an_app_called_FitQuest._The_design_should_reflect_a_fitness_challenge_theme_with_elements_symbolizing_daily_workout_go.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
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
  }
}
