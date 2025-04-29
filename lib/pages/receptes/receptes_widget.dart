import '/fit_quest/fit_quest_icon_button.dart';
import '/fit_quest/fit_quest_theme.dart';
import '/fit_quest/fit_quest_util.dart';
import 'package:flutter/material.dart';
import '/services/chat_service.dart';
export '/services/chat_service.dart';
import '/pages/receptes/receptes_model.dart';

// Función auxiliar para manejar el min en Dart
int min(int a, int b) {
  return a < b ? a : b;
}

class ReceptesWidget extends StatefulWidget {
  const ReceptesWidget({super.key});

  static String routeName = 'Receptes';
  static String routePath = '/receptes';

  @override
  State<ReceptesWidget> createState() => _ReceptesWidgetState();
}

class _ReceptesWidgetState extends State<ReceptesWidget> {
  late ReceptesModel _model;
  // Lista para almacenar el historial de chat
  List<Map<String, dynamic>> chatHistory = [];
  bool _isLoading = false;

  // Controlador para el desplazamiento del ListView
  final ScrollController _scrollController = ScrollController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReceptesModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  // Método para desplazarse al final del chat
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: fit_questTheme.of(context).secondary,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Chat messages display area
            Expanded(
              child: chatHistory.isEmpty && !_isLoading
                  ? Center(
                      child: Text(
                        'Empieza a chatear para recibir consejos, recetas y orientación nutricional.',
                        style: fit_questTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 16.0,
                              color: Colors.black
                            ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.all(10.0),
                      itemCount: chatHistory.length + (_isLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (_isLoading && index == chatHistory.length) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0),
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: fit_questTheme
                                    .of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: fit_questTheme.of(context).primary,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Pensando...',
                                    style:
                                        fit_questTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        final message = chatHistory[index];
                        return Align(
                          alignment: message['role'] == 'user'
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            padding: EdgeInsets.all(12.0),
                            constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.75,
                            ),
                            decoration: BoxDecoration(
                              color: message['role'] == 'user'
                                  ? fit_questTheme.of(context).primary
                                  : fit_questTheme
                                      .of(context)
                                      .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              message['message'] ?? '',
                              style: fit_questTheme
                                  .of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: message['role'] == 'user'
                                        ? Colors.white
                                        : fit_questTheme
                                            .of(context)
                                            .primaryText,
                                  ),
                            ),
                          ),
                        );
                      },
                    ),
            ),

            // Input area at the bottom
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 5.0, 15.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle:
                              fit_questTheme.of(context).labelMedium.override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'z1ff5g3p' /* Pregunta por cualquier cosa */,
                          ),
                          hintStyle:
                              fit_questTheme.of(context).bodySmall.override(
                                    fontFamily: 'Inter',
                                    color: Color(0x82000000),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: fit_questTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: fit_questTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor:
                              fit_questTheme.of(context).secondaryBackground,
                        ),
                        style: fit_questTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                        cursorColor: fit_questTheme.of(context).primaryText,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                    child: fit_questIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      fillColor: _isLoading
                          ? fit_questTheme.of(context).primaryBackground
                          : fit_questTheme.of(context).primary,
                      icon: Icon(
                        Icons.send,
                        color: _isLoading
                            ? fit_questTheme.of(context).secondaryText
                            : fit_questTheme.of(context).secondary,
                        size: 24.0,
                      ),
                      onPressed: _isLoading
                          ? null
                          : () async {
                              if (_model.textController!.text.isNotEmpty) {
                                // Guardar el mensaje y limpiar el campo
                                final userMessage = _model.textController!.text;
                                _model.textController!.clear();

                                // Añadir mensaje del usuario al historial
                                setState(() {
                                  chatHistory.add({
                                    'role': 'user',
                                    'message': userMessage,
                                  });
                                  _isLoading = true;
                                });

                                // Desplazar al final después de añadir el mensaje
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  _scrollToBottom();
                                });

                                try {
                                  // Obtener respuesta con timeout
                                  final botResponse =
                                      await getAnswer(chatHistory).timeout(
                                    Duration(seconds: 30),
                                    onTimeout: () =>
                                        "Lo siento, la respuesta está tardando demasiado. Por favor, intenta de nuevo.",
                                  );

                                  // Añadir respuesta del bot
                                  if (mounted) {
                                    setState(() {
                                      chatHistory.add({
                                        'role': 'model',
                                        'message': botResponse ??
                                            'No pude obtener una respuesta en este momento.',
                                      });
                                      _isLoading = false;
                                    });

                                    // Desplazar al final tras recibir respuesta
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      _scrollToBottom();
                                    });
                                  }
                                } catch (e) {
                                  if (mounted) {
                                    setState(() {
                                      chatHistory.add({
                                        'role': 'model',
                                        'message': 'Error inesperado: $e',
                                      });
                                      _isLoading = false;
                                    });
                                  }
                                }
                              }
                            },
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
