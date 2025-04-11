import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/info_message/info_message_widget.dart';
import '/fit_quest/fit_quest_drop_down.dart';
import '/fit_quest/fit_quest_icon_button.dart';
import '/fit_quest/fit_quest_language_selector.dart';
import '/fit_quest/fit_quest_theme.dart';
import '/fit_quest/fit_quest_util.dart';
import '/fit_quest/fit_quest_widgets.dart';
import '/fit_quest/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'user_info_model.dart';
export 'user_info_model.dart';

class UserInfoWidget extends StatefulWidget {
  const UserInfoWidget({super.key});

  static String routeName = 'UserInfo';
  static String routePath = '/userInfo';

  @override
  State<UserInfoWidget> createState() => _UserInfoWidgetState();
}

class _UserInfoWidgetState extends State<UserInfoWidget> {
  late UserInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserInfoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.emailTextController?.text = currentUserEmail;
      });
    });

    _model.userNameTextController ??= TextEditingController();
    _model.userNameFocusNode ??= FocusNode();
    _model.userNameFocusNode!.addListener(() => safeSetState(() {}));
    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();
    _model.emailFocusNode!.addListener(() => safeSetState(() {}));
    _model.dateOfBirthTextController ??= TextEditingController();
    _model.dateOfBirthFocusNode ??= FocusNode();
    _model.dateOfBirthFocusNode!.addListener(() => safeSetState(() {}));
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
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.1),
          child: AppBar(
            backgroundColor: fit_questTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'h4oxc0c4' /* Completa la informació */,
                    ),
                    style: fit_questTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: fit_questTheme.of(context).secondary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'bsi5d4sk' /* Necessitem que acabis d'omplir... */,
                    ),
                    style: fit_questTheme.of(context).labelMedium.override(
                          fontFamily: 'Poppins',
                          color: fit_questTheme.of(context).secondary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ].divide(SizedBox(height: 4.0)),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                child: fit_questIconButton(
                  borderColor: fit_questTheme.of(context).alternate,
                  borderRadius: 12.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: fit_questTheme.of(context).secondaryBackground,
                  icon: Icon(
                    Icons.close_rounded,
                    color: fit_questTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(AuthPageWidget.routeName);
                  },
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
            child: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 770.0,
                              ),
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      controller: _model.userNameTextController,
                                      focusNode: _model.userNameFocusNode,
                                      autofocus: true,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          '857to9gb' /* Nom d'usuari */,
                                        ),
                                        labelStyle: fit_questTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  fit_questTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        hintStyle: fit_questTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                        errorStyle: fit_questTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  fit_questTheme.of(context)
                                                      .error,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: fit_questTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: fit_questTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: fit_questTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: fit_questTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: (_model.userNameFocusNode
                                                    ?.hasFocus ??
                                                false)
                                            ? fit_questTheme.of(context)
                                                .accent1
                                            : fit_questTheme.of(context)
                                                .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16.0, 20.0, 16.0, 20.0),
                                      ),
                                      style: fit_questTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                          ),
                                      cursorColor:
                                          fit_questTheme.of(context).primary,
                                      validator: _model
                                          .userNameTextControllerValidator
                                          .asValidator(context),
                                    ),
                                    TextFormField(
                                      controller: _model.emailTextController,
                                      focusNode: _model.emailFocusNode,
                                      autofocus: true,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      readOnly: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: currentUserEmail,
                                        labelStyle: fit_questTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: fit_questTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                        errorStyle: fit_questTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  fit_questTheme.of(context)
                                                      .error,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: fit_questTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: fit_questTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: fit_questTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: fit_questTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: (_model
                                                    .emailFocusNode?.hasFocus ??
                                                false)
                                            ? fit_questTheme.of(context)
                                                .accent1
                                            : fit_questTheme.of(context)
                                                .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16.0, 20.0, 16.0, 20.0),
                                      ),
                                      style: fit_questTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                          ),
                                      keyboardType: TextInputType.emailAddress,
                                      cursorColor:
                                          fit_questTheme.of(context).primary,
                                      validator: _model
                                          .emailTextControllerValidator
                                          .asValidator(context),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.6,
                                            child: TextFormField(
                                              controller: _model
                                                  .dateOfBirthTextController,
                                              focusNode:
                                                  _model.dateOfBirthFocusNode,
                                              autofocus: false,
                                              textCapitalization:
                                                  TextCapitalization.words,
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: dateTimeFormat(
                                                  "d/M/y",
                                                  _model.birthday,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                labelStyle:
                                                    fit_questTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintStyle:
                                                    fit_questTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                errorStyle:
                                                    fit_questTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: fit_questTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: fit_questTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: fit_questTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: fit_questTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: fit_questTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    fit_questTheme.of(context)
                                                        .secondaryBackground,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(16.0, 20.0,
                                                            16.0, 20.0),
                                              ),
                                              style:
                                                  fit_questTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                              cursorColor:
                                                  fit_questTheme.of(context)
                                                      .primary,
                                              validator: _model
                                                  .dateOfBirthTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        fit_questIconButton(
                                          borderColor:
                                              fit_questTheme.of(context)
                                                  .primaryText,
                                          borderRadius: 8.0,
                                          borderWidth: 2.0,
                                          buttonSize:
                                              MediaQuery.sizeOf(context).width *
                                                  0.15,
                                          fillColor:
                                              fit_questTheme.of(context)
                                                  .primaryBackground,
                                          icon: Icon(
                                            Icons.edit_square,
                                            color: fit_questTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            final _datePickedDate =
                                                await showDatePicker(
                                              context: context,
                                              barrierDismissible: false,
                                              initialDate: getCurrentTimestamp,
                                              firstDate: (DateTime
                                                      .fromMicrosecondsSinceEpoch(
                                                          1174946400000000) ??
                                                  DateTime(1900)),
                                              lastDate: DateTime(2050),
                                            );

                                            if (_datePickedDate != null) {
                                              safeSetState(() {
                                                _model.datePicked = DateTime(
                                                  _datePickedDate.year,
                                                  _datePickedDate.month,
                                                  _datePickedDate.day,
                                                );
                                              });
                                            } else if (_model.datePicked !=
                                                null) {
                                              safeSetState(() {
                                                _model.datePicked =
                                                    getCurrentTimestamp;
                                              });
                                            }
                                            _model.birthday = _model.datePicked;
                                            safeSetState(() {});
                                          },
                                        ),
                                      ].divide(SizedBox(width: 1.0)),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'qonjf9uv' /* Idioma */,
                                      ),
                                      style: fit_questTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    fit_questLanguageSelector(
                                      width: double.infinity,
                                      height: 40.0,
                                      backgroundColor:
                                          fit_questTheme.of(context)
                                              .secondaryBackground,
                                      borderColor: fit_questTheme.of(context)
                                          .primaryText,
                                      dropdownIconColor:
                                          fit_questTheme.of(context)
                                              .secondaryText,
                                      borderRadius: 8.0,
                                      textStyle: fit_questTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                      hideFlags: false,
                                      flagSize: 24.0,
                                      flagTextGap: 8.0,
                                      currentLanguage:
                                          FFLocalizations.of(context)
                                              .languageCode,
                                      languages: FFLocalizations.languages(),
                                      onChanged: (lang) =>
                                          setAppLanguage(context, lang),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'wd03prww' /* Genere */,
                                      ),
                                      style: fit_questTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    fit_questDropDown<String>(
                                      controller:
                                          _model.genderValueController ??=
                                              FormFieldController<String>(null),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          '9ucb0wzy' /* Masculi */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'q92f3a3a' /* Femeni */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '5yxu6bcc' /* Altres */,
                                        )
                                      ],
                                      onChanged: (val) => safeSetState(
                                          () => _model.genderValue = val),
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 50.0,
                                      textStyle: fit_questTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'dfzlfyoe' /* Select... */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: fit_questTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: fit_questTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: fit_questTheme.of(context)
                                          .primaryText,
                                      borderWidth: 3.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ]
                                      .divide(SizedBox(height: 12.0))
                                      .addToEnd(SizedBox(height: 32.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 770.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Builder(
                      builder: (context) => Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 12.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var _shouldSetState = false;
                            _model.userNameExists =
                                await UsuarisTable().queryRows(
                              queryFn: (q) => q.eqOrNull(
                                'nom_usuari',
                                _model.userNameTextController.text,
                              ),
                            );
                            _shouldSetState = true;
                            if (_model.userNameExists?.length == 0) {
                              await UsuarisTable().insert({
                                'id': currentUserUid,
                                'nom_usuari':
                                    _model.userNameTextController.text,
                                'data_naixement':
                                    supaSerialize<DateTime>(_model.birthday),
                                'email': _model.emailTextController.text,
                                'idioma':
                                    FFLocalizations.of(context).languageCode,
                                'genere': _model.genderValue,
                              });

                              context.pushNamed(ReptesListWidget.routeName);

                              if (_shouldSetState) safeSetState(() {});
                              return;
                            } else {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: InfoMessageWidget(
                                        title: 'Error username',
                                        description:
                                            'Ja existeix un usuari amb aquest  nom, prova amb un altre!',
                                        isError: true,
                                      ),
                                    ),
                                  );
                                },
                              );

                              if (_shouldSetState) safeSetState(() {});
                              return;
                            }

                            if (_shouldSetState) safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'h8c7s602' /* Iniciar  */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
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
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
