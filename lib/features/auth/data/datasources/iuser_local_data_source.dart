import 'package:mercado_v2/features/auth/data/models/local_user_model.dart';

abstract class IuserLocalDataSource {
  Future<void> save(LocalUserModel localModel, String uid);
  Future<LocalUserModel?> get(String uid);
  Future<void> remove(String uid);
}