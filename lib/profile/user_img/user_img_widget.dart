import '/backend/supabase/supabase.dart';
import '/fit_quest/fit_quest_theme.dart';
import '/fit_quest/fit_quest_util.dart';
import '/friends/friend_info/friend_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'user_img_model.dart';
export 'user_img_model.dart';

class UserImgWidget extends StatefulWidget {
  const UserImgWidget({
    super.key,
    this.userId,
  });

  final String? userId;

  @override
  State<UserImgWidget> createState() => _UserImgWidgetState();
}

class _UserImgWidgetState extends State<UserImgWidget> {
  late UserImgModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserImgModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Builder(
        builder: (context) => Padding(
          padding: EdgeInsets.all(2.0),
          child: FutureBuilder<List<UsuarisRow>>(
            future: UsuarisTable().querySingleRow(
              queryFn: (q) => q.eqOrNull(
                'id',
                widget.userId,
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
              List<UsuarisRow> imageUsuarisRowList = snapshot.data!;

              final imageUsuarisRow = imageUsuarisRowList.isNotEmpty
                  ? imageUsuarisRowList.first
                  : null;

              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: FriendInfoWidget(
                          userInfo: imageUsuarisRow,
                        ),
                      );
                    },
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Image.network(
                    imageUsuarisRow!.fotoPerfil!,
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
