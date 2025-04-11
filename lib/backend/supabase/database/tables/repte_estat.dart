import '../database.dart';

class RepteEstatTable extends SupabaseTable<RepteEstatRow> {
  @override
  String get tableName => 'Repte_estat';

  @override
  RepteEstatRow createRow(Map<String, dynamic> data) => RepteEstatRow(data);
}

class RepteEstatRow extends SupabaseDataRow {
  RepteEstatRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RepteEstatTable();

  int get idRepte => getField<int>('id_repte')!;
  set idRepte(int value) => setField<int>('id_repte', value);

  String? get idUsuari => getField<String>('id_usuari');
  set idUsuari(String? value) => setField<String>('id_usuari', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
