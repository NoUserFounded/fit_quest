import '../database.dart';

class RepteCategoriesTable extends SupabaseTable<RepteCategoriesRow> {
  @override
  String get tableName => 'Repte_categories';

  @override
  RepteCategoriesRow createRow(Map<String, dynamic> data) =>
      RepteCategoriesRow(data);
}

class RepteCategoriesRow extends SupabaseDataRow {
  RepteCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RepteCategoriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get displayname => getField<String>('displayname')!;
  set displayname(String value) => setField<String>('displayname', value);

  String get color => getField<String>('color')!;
  set color(String value) => setField<String>('color', value);
}
