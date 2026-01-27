import 'package:mercado_v2/core/result/result.dart';
import 'package:mercado_v2/features/auth/domain/entities/user.dart';

abstract class IAuthRepository {
  Future<Result<User>> trySignInWithEmailAndPassword(String email, String password, {String? origin});
  Future<Result<void>> trySendPasswordResetEmail(String email, {String? origin});
  Future<Result<User>> tryCreateUserWithEmailAndPassword(String email, String password, {String? origin});
  Future<void> trySendEmailVerification({String? origin});
  Future<Result<bool>> tryVerifyEmail();
  Future<User?> tryGetCurrentUser({String? origin});
  Future<Result<void>> tryRefreshCurrentUser();
  Future<Result<void>> trySignOut({String? origin});
}