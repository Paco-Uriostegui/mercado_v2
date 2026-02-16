import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/entities/auth_user/new_auth_user.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/value_objects/newvalue_objects_export.dart';

abstract class NewIAuthRepository {
  Future<Result<NewAuthUser>> trySignInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Result<void>> trySendPasswordResetEmail(String email);
  Future<Result<void>> tryCreateUserWithEmailAndPassword(
    NewEmail email,
    NewPassword password,
  );
  Future<void> trySendEmailVerification();
  Future<Result<bool>> tryIsEmailVerified();
  Future<Result<NewAuthUser?>> tryGetCurrentUser();
  Future<Result<void>> tryRefreshCurrentUser();
  Future<Result<NewAuthUser?>> tryGetRefreshedCurrentUser();
  Future<Result<void>> trySignOut();
  Stream<NewAuthUser?> onStateChanges();
  Future<Result<void>> tryUpdateDisplayName(
    String firstName,
    String lastName,
    String secondLastName,
  );
}
