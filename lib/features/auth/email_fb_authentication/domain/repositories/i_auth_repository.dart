import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/data/models/auth_user_model.dart';
//import 'package:mercado_v2/features/auth/email_fb_authentication/domain/entities/auth_user/auth_user.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/value_objects/value_objects_export.dart';

abstract class IAuthRepository {
  Future<Result<void, AuthFailure>> trySignInWithEmailAndPassword(
    Email email,
    Password password,
  );
  // Future<Result<void, AuthFailure>> trySendPasswordResetEmail(Email email);
  Future<Result<void, AuthFailure>> tryCreateUserWithEmailAndPassword(
    Email email,
    Password password,
  );
  Future<Result<void, AuthFailure>> trySendVerificationEmail();
  Future<Result<bool, AuthFailure>> tryIsEmailVerified();
  // Future<Result<AuthUser?, AuthFailure>> tryGetCurrentUser();
  // Future<Result<void, AuthFailure>> tryRefreshCurrentUser();
  // Future<Result<AuthUser?, AuthFailure>> tryGetRefreshedCurrentUser();
  // Future<Result<void, AuthFailure>> trySignOut();
  Stream<AuthUserModel?> onStateChanges();
  // Future<Result<void, AuthFailure>> tryUpdateDisplayName(
  //   FirstName firstName,
  //   LastName lastName,
  //   SecondLastName secondLastName,
  // );
}
