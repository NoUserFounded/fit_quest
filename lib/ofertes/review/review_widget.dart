import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/fit_quest/fit_quest_theme.dart';
import '/fit_quest/fit_quest_util.dart';
import '/fit_quest/fit_quest_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'review_model.dart';
export 'review_model.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({
    super.key,
    required this.idOferta,
  });

  final int? idOferta;

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  late ReviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: fit_questTheme.of(context).secondary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: fit_questTheme.of(context).primary,
                size: 24.0,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'exwr2z96' /* Fes una valoració de l'orferta */,
                      ),
                      style: fit_questTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: fit_questTheme.of(context).primary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '9hoq7vy4' /* Explican's com s'ha sigut l'ex... */,
                      ),
                      style: fit_questTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: fit_questTheme.of(context).tertiary,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: FFLocalizations.of(context).getText(
                          'pf66fd4u' /* Explican'ns la teva experienci... */,
                        ),
                        hintStyle:
                            fit_questTheme.of(context).bodySmall.override(
                                  fontFamily: 'Inter',
                                  color: fit_questTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: fit_questTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: fit_questTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      style: fit_questTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: fit_questTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                      maxLines: 3,
                      minLines: 3,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'u526wgbv' /* Valoració: * */,
                      ),
                      style: fit_questTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: fit_questTheme.of(context).primary,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: RatingBar.builder(
                        onRatingUpdate: (newValue) => safeSetState(
                            () => _model.ratingBarValue = newValue),
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: fit_questTheme.of(context).tertiary,
                        ),
                        direction: Axis.horizontal,
                        initialRating: _model.ratingBarValue ??= 0.0,
                        unratedColor: Color(0xFF9E9E9E),
                        itemCount: 5,
                        itemSize: 24.0,
                        glowColor: fit_questTheme.of(context).tertiary,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          await ValoracionsTable().insert({
                            'comentari': _model.textController.text,
                            'id_user': currentUserUid,
                            'puntuacio': _model.ratingBarValue,
                            'id_oferta': widget.idOferta,
                          });
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Valoració enviada!',
                                style: TextStyle(
                                  color:
                                      fit_questTheme.of(context).primaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: Color(0xFF0CDD6B),
                            ),
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'r1ls28oo' /* Enviar */,
                        ),
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF04A24C),
                          textStyle:
                              fit_questTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
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
