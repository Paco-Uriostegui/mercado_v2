import 'package:mercado_v2/features/auth/email_fb_authentication/data/models/auth_user_model.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/entities/auth_user/auth_user.dart';

abstract class IAuthRemoteDataSource {
  Future<AuthUserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  // Future<void> sendPasswordResetEmail({required String email});
  Future<AuthUserModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> sendVerificationEmail();
  Future<bool> isEmailVerified();
  // AuthUser? getCurrentUser();
  // Future<void> refreshCurrentUser();
  // Future<void> signOut();
  Stream<AuthUser?> authStateChanges();
  // Future<void> updateDisplayName(String name);
}
