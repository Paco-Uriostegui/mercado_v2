import 'package:mercado_v2/features/auth/domain/entities/user.dart';

abstract class AuthRemoteDataSource {

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> sendPasswordResetEmail({required String email});
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> sendEmailVerification();
  Future<bool> isEmailVerified();
  User getCurrentUser();
  Future<void> refreshCurrentUser();
  Future<void> signOut();
}
