import 'dart:convert';
import 'package:mercado_v2/core/result/failure.dart';
import 'package:mercado_v2/features/auth/data/datasources/iuser_local_data_source.dart';
import 'package:mercado_v2/features/auth/data/models/local_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPrefDataSourceImpl implements IuserLocalDataSource {
  final SharedPreferences _sharedPref;

  UserSharedPrefDataSourceImpl({required SharedPreferences sharedPref})
    : _sharedPref = sharedPref;
  @override
  Future<void> remove(String uid) async {
    try {
      await _sharedPref.remove(uid);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LocalUserModel?> getLocalModel(String uid) async {
    try {
      final model = _sharedPref.getString(uid);
      if (model == null) return null;
      return LocalUserModel.fromJson(jsonDecode(model));
    } catch (e) {
      // TODO reportar con crashlytics
      rethrow;
    }
  }

  @override
  Future<void> saveLocalModel(LocalUserModel localModel, String uid) async {
    try {
      await _sharedPref.setString(uid, jsonEncode(localModel.toJson()));
    } catch (e) {
      rethrow;
    }
  }
}
