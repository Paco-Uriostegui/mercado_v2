import 'package:mercado_v2/core/result/result.dart';
import 'package:mercado_v2/features/auth/domain/entities/user.dart';

abstract class IuserRepository {
  Future<Result<void>> saveUser(User user);
  Future<Result<User?>> getUser(String id);
  Future<Result<void>> removeUser(String id);
}