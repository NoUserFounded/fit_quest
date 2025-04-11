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

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get nomUsuari => getField<String>('nom_usuari')!;
  set nomUsuari(String value) => setField<String>('nom_usuari', value);

  DateTime? get dataNaixement => getField<DateTime>('data_naixement');
  set dataNaixement(DateTime? value) =>
      setField<DateTime>('data_naixement', value);

  String? get idioma => getField<String>('idioma');
  set idioma(String? value) => setField<String>('idioma', value);

  String? get interesos => getField<String>('interesos');
  set interesos(String? value) => setField<String>('interesos', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String? get fotoPerfil => getField<String>('foto_perfil');
  set fotoPerfil(String? value) => setField<String>('foto_perfil', value);

  String? get genere => getField<String>('genere');
  set genere(String? value) => setField<String>('genere', value);
}
