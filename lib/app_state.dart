import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'fit_quest/fit_quest_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_userInfo') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_userInfo') ?? '{}';
          _userInfo =
              UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  UserStruct _userInfo = UserStruct();
  UserStruct get userInfo => _userInfo;
  set userInfo(UserStruct value) {
    _userInfo = value;
    secureStorage.setString('ff_userInfo', value.serialize());
  }

  void deleteUserInfo() {
    secureStorage.delete(key: 'ff_userInfo');
  }

  void updateUserInfoStruct(Function(UserStruct) updateFn) {
    updateFn(_userInfo);
    secureStorage.setString('ff_userInfo', _userInfo.serialize());
  }

  List<dynamic> _solicitudEnviades = [];
  List<dynamic> get solicitudEnviades => _solicitudEnviades;
  set solicitudEnviades(List<dynamic> value) {
    _solicitudEnviades = value;
  }

  void addToSolicitudEnviades(dynamic value) {
    solicitudEnviades.add(value);
  }

  void removeFromSolicitudEnviades(dynamic value) {
    solicitudEnviades.remove(value);
  }

  void removeAtIndexFromSolicitudEnviades(int index) {
    solicitudEnviades.removeAt(index);
  }

  void updateSolicitudEnviadesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    solicitudEnviades[index] = updateFn(_solicitudEnviades[index]);
  }

  void insertAtIndexInSolicitudEnviades(int index, dynamic value) {
    solicitudEnviades.insert(index, value);
  }

  List<dynamic> _solicitudsRebudes = [];
  List<dynamic> get solicitudsRebudes => _solicitudsRebudes;
  set solicitudsRebudes(List<dynamic> value) {
    _solicitudsRebudes = value;
  }

  void addToSolicitudsRebudes(dynamic value) {
    solicitudsRebudes.add(value);
  }

  void removeFromSolicitudsRebudes(dynamic value) {
    solicitudsRebudes.remove(value);
  }

  void removeAtIndexFromSolicitudsRebudes(int index) {
    solicitudsRebudes.removeAt(index);
  }

  void updateSolicitudsRebudesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    solicitudsRebudes[index] = updateFn(_solicitudsRebudes[index]);
  }

  void insertAtIndexInSolicitudsRebudes(int index, dynamic value) {
    solicitudsRebudes.insert(index, value);
  }

  List<dynamic> _amistats = [];
  List<dynamic> get amistats => _amistats;
  set amistats(List<dynamic> value) {
    _amistats = value;
  }

  void addToAmistats(dynamic value) {
    amistats.add(value);
  }

  void removeFromAmistats(dynamic value) {
    amistats.remove(value);
  }

  void removeAtIndexFromAmistats(int index) {
    amistats.removeAt(index);
  }

  void updateAmistatsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    amistats[index] = updateFn(_amistats[index]);
  }

  void insertAtIndexInAmistats(int index, dynamic value) {
    amistats.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
