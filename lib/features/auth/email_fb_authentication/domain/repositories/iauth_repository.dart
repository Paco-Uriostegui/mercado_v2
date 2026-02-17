// import 'package:mercado_v2/app/core/result/result.dart';
// import 'package:mercado_v2/features/auth/email_fb_authentication/domain/entities/auth_user/auth_user.dart';
// import 'package:mercado_v2/features/auth/email_fb_authentication/domain/value_objects/user/value_objects_export.dart';

// abstract class IAuthRepository {
//   Future<Result<AuthUser>> trySignInWithEmailAndPassword(String email, String password);
//   Future<Result<void>> trySendPasswordResetEmail(String email);
//   Future<Result<void>> tryCreateUserWithEmailAndPassword(Email email, Password password);
//   Future<void> trySendEmailVerification();
//   Future<Result<bool>> tryVerifyEmail();
//   Future<Result<AuthUser?>> tryGetCurrentUser();
//   Future<Result<void>> tryRefreshCurrentUser();
//   Future<Result<AuthUser?>> tryGetRefreshedCurrentUser();
//   Future<Result<void>> trySignOut();
//   Stream<AuthUser?> onStateChanges();
//   Future<Result<void>> tryUpdateDisplayName(String firstName, String lastName, String secondLastName);
  
// }