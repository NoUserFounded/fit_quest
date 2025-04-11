// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/fit_quest/fit_quest_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? username,
    DateTime? birthday,
    String? gender,
    String? profilePicture,
  })  : _username = username,
        _birthday = birthday,
        _gender = gender,
        _profilePicture = profilePicture;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  set birthday(DateTime? val) => _birthday = val;

  bool hasBirthday() => _birthday != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "profilePicture" field.
  String? _profilePicture;
  String get profilePicture => _profilePicture ?? '';
  set profilePicture(String? val) => _profilePicture = val;

  bool hasProfilePicture() => _profilePicture != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        username: data['username'] as String?,
        birthday: data['birthday'] as DateTime?,
        gender: data['gender'] as String?,
        profilePicture: data['profilePicture'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'username': _username,
        'birthday': _birthday,
        'gender': _gender,
        'profilePicture': _profilePicture,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'birthday': serializeParam(
          _birthday,
          ParamType.DateTime,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'profilePicture': serializeParam(
          _profilePicture,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        birthday: deserializeParam(
          data['birthday'],
          ParamType.DateTime,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        profilePicture: deserializeParam(
          data['profilePicture'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        username == other.username &&
        birthday == other.birthday &&
        gender == other.gender &&
        profilePicture == other.profilePicture;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([username, birthday, gender, profilePicture]);
}

UserStruct createUserStruct({
  String? username,
  DateTime? birthday,
  String? gender,
  String? profilePicture,
}) =>
    UserStruct(
      username: username,
      birthday: birthday,
      gender: gender,
      profilePicture: profilePicture,
    );
