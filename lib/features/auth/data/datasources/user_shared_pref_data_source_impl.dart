import 'dart:convert';
import 'package:mercado_v2/features/auth/data/datasources/iuser_local_data_source.dart';
import 'package:mercado_v2/features/auth/data/models/local_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPrefDataSourceImpl implements IuserLocalDataSource {
  final SharedPreferences _sharedPref;

  UserSharedPrefDataSourceImpl({required SharedPreferences sharedPref})
    : _sharedPref = sharedPref;
  @override
  Future<void> remove(String uid) async {
    await _sharedPref.remove(uid);
  }

  @override
  Future<LocalUserModel?> get(String uid) async {
    final model = _sharedPref.getString(uid);
    if (model == null) return null;
    return LocalUserModel.fromJson(jsonDecode(model));
  }

  @override
  Future<void> save(LocalUserModel localModel, String uid) async {
    await _sharedPref.setString(uid, jsonEncode(localModel.toJson()));
  }
}
