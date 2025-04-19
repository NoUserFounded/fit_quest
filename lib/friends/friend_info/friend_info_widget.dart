import '/backend/supabase/supabase.dart';
import '/fit_quest/fit_quest_icon_button.dart';
import '/fit_quest/fit_quest_theme.dart';
import '/fit_quest/fit_quest_util.dart';
import 'package:flutter/material.dart';
import 'friend_info_model.dart';
export 'friend_info_model.dart';

class FriendInfoWidget extends StatefulWidget {
  const FriendInfoWidget({
    super.key,
    required this.userInfo,
  });

  final UsuarisRow? userInfo;

  @override
  State<FriendInfoWidget> createState() => _FriendInfoWidgetState();
}

class _FriendInfoWidgetState extends State<FriendInfoWidget> {
  late FriendInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendInfoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        width: 210.0,
        height: 180.0,
        decoration: BoxDecoration(
          color: fit_questTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x34090F13),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: fit_questIconButton(
                    borderRadius: 8.0,
                    buttonSize: 30.0,
                    icon: Icon(
                      Icons.close_sharp,
                      color: Colors.black,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(
                  widget.userInfo!.fotoPerfil!,
                  width: 60.0,
                  height: 60.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.userInfo?.nomUsuari,
                    'userName',
                  ),
                  style: fit_questTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.userInfo?.email,
                    'email',
                  ),
                  style: fit_questTheme.of(context).labelSmall.override(
                        fontFamily: 'Poppins',
                        color: fit_questTheme.of(context).tertiary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
