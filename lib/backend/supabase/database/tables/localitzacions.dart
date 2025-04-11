import '../database.dart';

class LocalitzacionsTable extends SupabaseTable<LocalitzacionsRow> {
  @override
  String get tableName => 'Localitzacions';

  @override
  LocalitzacionsRow createRow(Map<String, dynamic> data) =>
      LocalitzacionsRow(data);
}

class LocalitzacionsRow extends SupabaseDataRow {
  LocalitzacionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LocalitzacionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get nom => getField<String>('nom')!;
  set nom(String value) => setField<String>('nom', value);

  String get direccio => getField<String>('direccio')!;
  set direccio(String value) => setField<String>('direccio', value);

  double get latitud => getField<double>('latitud')!;
  set latitud(double value) => setField<double>('latitud', value);

  double get longitud => getField<double>('longitud')!;
  set longitud(double value) => setField<double>('longitud', value);

  String get tipus => getField<String>('tipus')!;
  set tipus(String value) => setField<String>('tipus', value);
}
