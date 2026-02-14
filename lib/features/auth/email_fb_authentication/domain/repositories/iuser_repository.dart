import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/entities/user/user.dart';

abstract class IUserRepository {
  Future<Result<void>> saveUser(User user);
  Future<Result<User?>> getUser(String id);
  Future<Result<void>> removeUser(String id);
}