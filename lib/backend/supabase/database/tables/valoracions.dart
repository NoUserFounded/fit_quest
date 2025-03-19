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

  int? get puntuacio => getField<int>('puntuacio');
  set puntuacio(int? value) => setField<int>('puntuacio', value);

  String? get idUser => getField<String>('id_user');
  set idUser(String? value) => setField<String>('id_user', value);

  String? get idOferta => getField<String>('id_oferta');
  set idOferta(String? value) => setField<String>('id_oferta', value);
}
