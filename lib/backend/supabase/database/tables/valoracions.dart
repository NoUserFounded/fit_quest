import '../database.dart';

class ValoracionsTable extends SupabaseTable<ValoracionsRow> {
  @override
  String get tableName => 'Valoracions';

  @override
  ValoracionsRow createRow(Map<String, dynamic> data) => ValoracionsRow(data);
}

class ValoracionsRow extends SupabaseDataRow {
  ValoracionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ValoracionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get comentari => getField<String>('comentari');
  set comentari(String? value) => setField<String>('comentari', value);

  double? get puntuacio => getField<double>('puntuacio');
  set puntuacio(double? value) => setField<double>('puntuacio', value);

  String? get idUser => getField<String>('id_user');
  set idUser(String? value) => setField<String>('id_user', value);

  int get idOferta => getField<int>('id_oferta')!;
  set idOferta(int value) => setField<int>('id_oferta', value);
}
