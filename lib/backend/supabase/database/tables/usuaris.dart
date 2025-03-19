import '../database.dart';

class UsuarisTable extends SupabaseTable<UsuarisRow> {
  @override
  String get tableName => 'Usuaris';

  @override
  UsuarisRow createRow(Map<String, dynamic> data) => UsuarisRow(data);
}

class UsuarisRow extends SupabaseDataRow {
  UsuarisRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuarisTable();

  String get nomUsuari => getField<String>('nom_usuari')!;
  set nomUsuari(String value) => setField<String>('nom_usuari', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get dataNaixement => getField<DateTime>('data_naixement');
  set dataNaixement(DateTime? value) =>
      setField<DateTime>('data_naixement', value);

  String? get idioma => getField<String>('idioma');
  set idioma(String? value) => setField<String>('idioma', value);

  List<String> get amics => getListField<String>('amics');
  set amics(List<String>? value) => setListField<String>('amics', value);
}
