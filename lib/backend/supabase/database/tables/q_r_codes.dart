import '../database.dart';

class QRCodesTable extends SupabaseTable<QRCodesRow> {
  @override
  String get tableName => 'QR_Codes';

  @override
  QRCodesRow createRow(Map<String, dynamic> data) => QRCodesRow(data);
}

class QRCodesRow extends SupabaseDataRow {
  QRCodesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => QRCodesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get code => getField<String>('code')!;
  set code(String value) => setField<String>('code', value);

  String get targetType => getField<String>('target_type')!;
  set targetType(String value) => setField<String>('target_type', value);

  String get targetId => getField<String>('target_id')!;
  set targetId(String value) => setField<String>('target_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool get used => getField<bool>('used')!;
  set used(bool value) => setField<bool>('used', value);

  DateTime? get usedAt => getField<DateTime>('used_at');
  set usedAt(DateTime? value) => setField<DateTime>('used_at', value);
}
