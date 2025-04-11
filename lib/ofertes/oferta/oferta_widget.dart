import '/backend/supabase/supabase.dart';
import '/fit_quest/fit_quest_icon_button.dart';
import '/fit_quest/fit_quest_static_map.dart';
import '/fit_quest/fit_quest_theme.dart';
import '/fit_quest/fit_quest_util.dart';
import '/fit_quest/fit_quest_widgets.dart';
import '/fit_quest/custom_functions.dart' as functions;
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'oferta_model.dart';
export 'oferta_model.dart';

class OfertaWidget extends StatefulWidget {
  const OfertaWidget({
    super.key,
    required this.ofertId,
    required this.rating,
  });

  final int? ofertId;
  final double? rating;

  static String routeName = 'Oferta';
  static String routePath = '/Oferta';

  @override
  State<OfertaWidget> createState() => _OfertaWidgetState();
}

class _OfertaWidgetState extends State<OfertaWidget> {
  late OfertaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OfertaModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OfertesRow>>(
      future: OfertesTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'Id',
          widget.ofertId,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: fit_questTheme.of(context).secondary,
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
        List<OfertesRow> ofertaOfertesRowList = snapshot.data!;

        final ofertaOfertesRow =
            ofertaOfertesRowList.isNotEmpty ? ofertaOfertesRowList.first : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: fit_questTheme.of(context).secondary,
            appBar: AppBar(
              backgroundColor: fit_questTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: fit_questIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: fit_questTheme.of(context).secondary,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'z5g0z6nb' /* Detalls */,
                ),
                style: fit_questTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: fit_questTheme.of(context).secondary,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 50.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          valueOrDefault<String>(
                            ofertaOfertesRow?.urlImatge,
                            'https://t4.ftcdn.net/jpg/05/17/53/57/360_F_517535714_DfeMvOjcgC5aNUapI4PMnZ6ZAEc7Dk82.jpg',
                          ),
                          width: 275.0,
                          height: 175.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 15.0, 15.0, 15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        ofertaOfertesRow?.title,
                                        'TITLE',
                                      ),
                                      style: fit_questTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  RatingBarIndicator(
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star_rounded,
                                      color:
                                          fit_questTheme.of(context).primary,
                                    ),
                                    direction: Axis.horizontal,
                                    rating: widget.rating!,
                                    unratedColor:
                                        fit_questTheme.of(context).accent1,
                                    itemCount: 5,
                                    itemSize: 24.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        ofertaOfertesRow?.descripcio,
                                        'description',
                                      ),
                                      style: fit_questTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF04B974),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'sukytdnb' /* Category: */,
                                      ),
                                      style: fit_questTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: FutureBuilder<
                                        List<OfertesCategoriesRow>>(
                                      future: OfertesCategoriesTable()
                                          .querySingleRow(
                                        queryFn: (q) => q.eqOrNull(
                                          'id',
                                          ofertaOfertesRow?.idCategoria,
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
                                        List<OfertesCategoriesRow>
                                            buttonOfertesCategoriesRowList =
                                            snapshot.data!;

                                        final buttonOfertesCategoriesRow =
                                            buttonOfertesCategoriesRowList
                                                    .isNotEmpty
                                                ? buttonOfertesCategoriesRowList
                                                    .first
                                                : null;

                                        return FFButtonWidget(
                                          onPressed: true
                                              ? null
                                              : () {
                                                  print('Button pressed ...');
                                                },
                                          text: buttonOfertesCategoriesRow!.nom,
                                          options: FFButtonOptions(
                                            height: 30.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: fit_questTheme.of(context)
                                                .primary,
                                            textStyle:
                                                fit_questTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      'Vàlid fins: ${dateTimeFormat(
                                        "EEEE, d MMMM H:mm",
                                        ofertaOfertesRow?.finishAt,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )}',
                                      style: fit_questTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF04B974),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 2.0,
                        color: fit_questTheme.of(context).alternate,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            25.0, 0.0, 15.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'ak7h9prn' /* Price */,
                                      ),
                                      style: fit_questTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Text(
                                          formatNumber(
                                            ofertaOfertesRow!.preu!,
                                            formatType: FormatType.decimal,
                                            decimalType:
                                                DecimalType.commaDecimal,
                                            currency: '€',
                                          ),
                                          style: fit_questTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    fit_questTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Text(
                                          formatNumber(
                                            functions.calculatePercentatge(
                                                ofertaOfertesRow.descompte,
                                                ofertaOfertesRow.preu),
                                            formatType: FormatType.decimal,
                                            decimalType:
                                                DecimalType.commaDecimal,
                                            currency: '€',
                                          ),
                                          style: fit_questTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    fit_questTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '3budb9ph' /* Descompte */,
                                    ),
                                    style: fit_questTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    '${ofertaOfertesRow.descompte.toString()}%',
                                    style: fit_questTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 2.0,
                        color: fit_questTheme.of(context).alternate,
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '5rihyd67' /* Localització */,
                            ),
                            style: fit_questTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: fit_questStaticMap(
                          location: LatLng(41.3857849, 2.0484717),
                          apiKey:
                              'pk.eyJ1IjoiZXJpYy1zYW5jbGltZW5zIiwiYSI6ImNtOHQ2c3g5NzA4a20ycXB3a3RyNWlmYXUifQ.KJv_b0MZeRe3om_eGfoesw',
                          style: mapbox.MapBoxStyle.Streets,
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: MediaQuery.sizeOf(context).height * 0.25,
                          fit: BoxFit.cover,
                          borderRadius: BorderRadius.circular(15.0),
                          markerColor: fit_questTheme.of(context).error,
                          zoom: 10,
                          tilt: 0,
                          rotation: 0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await launchURL(ofertaOfertesRow.urlRedirect);
                          },
                          text: FFLocalizations.of(context).getText(
                            'x1imfp0z' /* Anar a l'oferta */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
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
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 2.0,
                        color: fit_questTheme.of(context).alternate,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
