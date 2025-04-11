import '../database.dart';

class AmistatsTable extends SupabaseTable<AmistatsRow> {
  @override
  String get tableName => 'Amistats';

  @override
  AmistatsRow createRow(Map<String, dynamic> data) => AmistatsRow(data);
}

class AmistatsRow extends SupabaseDataRow {
  AmistatsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AmistatsTable();

  String get usuari => getField<String>('usuari')!;
  set usuari(String value) => setField<String>('usuari', value);

  String get amic => getField<String>('amic')!;
  set amic(String value) => setField<String>('amic', value);

  DateTime get createdAt => getField<DateTime>('createdAt')!;
  set createdAt(DateTime value) => setField<DateTime>('createdAt', value);

  String get estat => getField<String>('estat')!;
  set estat(String value) => setField<String>('estat', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);
}
