import '../database.dart';

class OfertesCategoriesTable extends SupabaseTable<OfertesCategoriesRow> {
  @override
  String get tableName => 'Ofertes_categories';

  @override
  OfertesCategoriesRow createRow(Map<String, dynamic> data) =>
      OfertesCategoriesRow(data);
}

class OfertesCategoriesRow extends SupabaseDataRow {
  OfertesCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OfertesCategoriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get nom => getField<String>('nom')!;
  set nom(String value) => setField<String>('nom', value);
}
