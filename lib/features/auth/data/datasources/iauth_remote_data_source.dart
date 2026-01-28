import 'package:mercado_v2/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {

  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> sendPasswordResetEmail({required String email});
  Future<UserModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> sendEmailVerification();
  Future<bool> isEmailVerified();
  UserModel getCurrentUser();
  Future<void> refreshCurrentUser();
  Future<void> signOut();
}
