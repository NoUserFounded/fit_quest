import '/backend/supabase/supabase.dart';
import '/fit_quest/fit_quest_animations.dart';
import '/fit_quest/fit_quest_theme.dart';
import '/fit_quest/fit_quest_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'repte_small_card_model.dart';
export 'repte_small_card_model.dart';

class RepteSmallCardWidget extends StatefulWidget {
  const RepteSmallCardWidget({
    super.key,
    required this.repteId,
    required this.repteEstat,
  });

  final int? repteId;
  final String? repteEstat;

  @override
  State<RepteSmallCardWidget> createState() => _RepteSmallCardWidgetState();
}

class _RepteSmallCardWidgetState extends State<RepteSmallCardWidget>
    with TickerProviderStateMixin {
  late RepteSmallCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RepteSmallCardModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: Offset(50.0, 0.0),
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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
      child: Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
          color: fit_questTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x230E151B),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: FutureBuilder<List<ReptesRow>>(
          future: ReptesTable().querySingleRow(
            queryFn: (q) => q.eqOrNull(
              'id',
              widget.repteId,
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
            List<ReptesRow> stackReptesRowList = snapshot.data!;

            final stackReptesRow =
                stackReptesRowList.isNotEmpty ? stackReptesRowList.first : null;

            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(0.0),
                  ),
                  child: Image.network(
                    stackReptesRow!.imatge!,
                    width: 120.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(130.0, 0.0, 12.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          stackReptesRow.titol,
                          'Title',
                        ),
                        style: fit_questTheme.of(context).bodyLarge.override(
                              fontFamily: 'Poppins',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.repteEstat,
                            'status',
                          ),
                          style: fit_questTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: 'Poppins',
                                color: () {
                                  if (widget.repteEstat == 'Fallit') {
                                    return fit_questTheme.of(context).error;
                                  } else if (widget.repteEstat ==
                                      'Completat') {
                                    return fit_questTheme.of(context).success;
                                  } else if (widget.repteEstat ==
                                      'En proces') {
                                    return Color(0xFFDF823F);
                                  } else {
                                    return fit_questTheme.of(context)
                                        .primaryText;
                                  }
                                }(),
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FutureBuilder<List<RepteCategoriesRow>>(
                            future: RepteCategoriesTable().querySingleRow(
                              queryFn: (q) => q.eqOrNull(
                                'id',
                                stackReptesRow.categoryId,
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
                                  'category',
                                ),
                                style: fit_questTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: colorFromCssString(
                                        textRepteCategoriesRow!.color,
                                        defaultColor: Colors.black,
                                      ),
                                      letterSpacing: 0.0,
                                    ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
