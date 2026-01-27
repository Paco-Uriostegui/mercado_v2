import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:mercado_v2/core/result/failure.dart';
import 'package:mercado_v2/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mercado_v2/features/auth/data/models/user_model.dart';

class FirebaseAuthDataSourceImpl implements AuthRemoteDataSource {
  final fb.FirebaseAuth _firebaseAuth;

  FirebaseAuthDataSourceImpl({required fb.FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredential.user;
    if (user == null) {
      throw AuthException('User is null after signIn');
    }
    return UserModel.fromFirebaseUser(user);
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<UserModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
     final user = userCredential.user;
    if (user == null) {
      throw AuthException('User is null after signIn');
    }
    return UserModel.fromFirebaseUser(user);
  }

  @override
  Future<void> sendEmailVerification() async {
    await _firebaseAuth.currentUser?.sendEmailVerification();
  }

  @override
  Future<bool> isEmailVerified() async {
    await _firebaseAuth.currentUser?.reload();
    return _firebaseAuth.currentUser?.emailVerified ?? false;
  }

  @override
  fb.User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  @override
  Future<void> refreshCurrentUser() async {
    await _firebaseAuth.currentUser?.getIdToken(true);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
