import '../database.dart';

class ReptesTable extends SupabaseTable<ReptesRow> {
  @override
  String get tableName => 'Reptes';

  @override
  ReptesRow createRow(Map<String, dynamic> data) => ReptesRow(data);
}

class ReptesRow extends SupabaseDataRow {
  ReptesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReptesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get titol => getField<String>('titol')!;
  set titol(String value) => setField<String>('titol', value);

  String get descripcio => getField<String>('descripcio')!;
  set descripcio(String value) => setField<String>('descripcio', value);

  String? get imatge => getField<String>('imatge');
  set imatge(String? value) => setField<String>('imatge', value);

  int? get duracio => getField<int>('duracio');
  set duracio(int? value) => setField<int>('duracio', value);

  int? get categoryId => getField<int>('category_id');
  set categoryId(int? value) => setField<int>('category_id', value);

  String? get details => getField<String>('details');
  set details(String? value) => setField<String>('details', value);

  String? get urlVideo => getField<String>('url_video');
  set urlVideo(String? value) => setField<String>('url_video', value);
}
