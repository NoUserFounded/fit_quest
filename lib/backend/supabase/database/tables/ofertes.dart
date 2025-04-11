import '../database.dart';

class OfertesTable extends SupabaseTable<OfertesRow> {
  @override
  String get tableName => 'Ofertes';

  @override
  OfertesRow createRow(Map<String, dynamic> data) => OfertesRow(data);
}

class OfertesRow extends SupabaseDataRow {
  OfertesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OfertesTable();

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String get descripcio => getField<String>('descripcio')!;
  set descripcio(String value) => setField<String>('descripcio', value);

  String? get urlImatge => getField<String>('url_imatge');
  set urlImatge(String? value) => setField<String>('url_imatge', value);

  String get urlRedirect => getField<String>('url_redirect')!;
  set urlRedirect(String value) => setField<String>('url_redirect', value);

  double get descompte => getField<double>('descompte')!;
  set descompte(double value) => setField<double>('descompte', value);

  double? get preu => getField<double>('preu');
  set preu(double? value) => setField<double>('preu', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get finishAt => getField<DateTime>('finish_at');
  set finishAt(DateTime? value) => setField<DateTime>('finish_at', value);

  int get idCategoria => getField<int>('id_categoria')!;
  set idCategoria(int value) => setField<int>('id_categoria', value);

  String? get idLocalitzacio => getField<String>('id_localitzacio');
  set idLocalitzacio(String? value) =>
      setField<String>('id_localitzacio', value);

  int get id => getField<int>('Id')!;
  set id(int value) => setField<int>('Id', value);
}
