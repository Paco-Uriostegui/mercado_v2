import 'package:mercado_v2/core/result/result.dart';
import 'package:mercado_v2/features/auth/domain/entities/auth_user/auth_user.dart';

abstract class IAuthRepository {
  Future<Result<AuthUser>> trySignInWithEmailAndPassword(String email, String password);
  Future<Result<void>> trySendPasswordResetEmail(String email);
  Future<Result<AuthUser>> tryCreateUserWithEmailAndPassword(String email, String password);
  Future<void> trySendEmailVerification();
  Future<Result<bool>> tryVerifyEmail();
  Future<AuthUser?> tryGetCurrentUser();
  Future<Result<void>> tryRefreshCurrentUser();
  Future<Result<void>> trySignOut();
}