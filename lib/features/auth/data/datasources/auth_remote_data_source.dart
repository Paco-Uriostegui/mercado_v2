abstract class AuthRemoteDataSource<T> {

  Future<T?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> sendPasswordResetEmail({required String email});
  Future<T?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> sendEmailVerification();
  Future<bool> isEmailVerified();
  T? getCurrentUser();
  Future<void> refreshCurrentUser();
  Future<void> signOut();
}
