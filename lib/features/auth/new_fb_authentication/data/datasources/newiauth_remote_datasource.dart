import 'package:mercado_v2/features/auth/new_fb_authentication/domain/entities/auth_user/new_auth_user.dart';

abstract class NewIAuthRemoteDataSource {
  Future<NewAuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> sendPasswordResetEmail({required String email});
  Future<NewAuthUser> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> sendEmailVerification();
  Future<bool> isEmailVerified();
  NewAuthUser? getCurrentUser();
  Future<void> refreshCurrentUser();
  Future<void> signOut();
  Stream<NewAuthUser?> authStateChanges();
  Future<void> updateDisplayName(String name);
}
