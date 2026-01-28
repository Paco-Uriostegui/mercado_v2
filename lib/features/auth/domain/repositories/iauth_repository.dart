import 'package:mercado_v2/core/result/result.dart';
import 'package:mercado_v2/features/auth/domain/entities/user.dart';

abstract class IAuthRepository {
  Future<Result<User>> trySignInWithEmailAndPassword(String email, String password);
  Future<Result<void>> trySendPasswordResetEmail(String email);
  Future<Result<User>> tryCreateUserWithEmailAndPassword(String email, String password);
  Future<void> trySendEmailVerification();
  Future<Result<bool>> tryVerifyEmail();
  Future<User?> tryGetCurrentUser();
  Future<Result<void>> tryRefreshCurrentUser();
  Future<Result<void>> trySignOut();
}