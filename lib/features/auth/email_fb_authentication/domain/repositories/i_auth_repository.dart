import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/entities/auth_user/auth_user.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/value_objects/value_objects_export.dart';

abstract class IAuthRepository {
  Future<Result<void>> trySignInWithEmailAndPassword(
    Email email,
    Password password,
  );
  Future<Result<void>> trySendPasswordResetEmail(Email email);
  Future<Result<void>> tryCreateUserWithEmailAndPassword(
    Email email,
    Password password,
  );
  Future<void> trySendEmailVerification();
  Future<Result<bool>> tryIsEmailVerified();
  Future<Result<AuthUser?>> tryGetCurrentUser();
  Future<Result<void>> tryRefreshCurrentUser();
  Future<Result<AuthUser?>> tryGetRefreshedCurrentUser();
  Future<Result<void>> trySignOut();
  Stream<AuthUser?> onStateChanges();
  Future<Result<void>> tryUpdateDisplayName(
    FirstName firstName,
    LastName lastName,
    SecondLastName secondLastName,
  );
}
