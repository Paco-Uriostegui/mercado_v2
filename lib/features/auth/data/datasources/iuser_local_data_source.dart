import 'package:mercado_v2/features/auth/data/models/local_user_model.dart';

abstract class IuserLocalDataSource {
  Future<void> saveLocalModel(LocalUserModel localModel, String uid);
  Future<LocalUserModel?> getLocalModel(String uid);
  Future<void> remove(String uid);
}