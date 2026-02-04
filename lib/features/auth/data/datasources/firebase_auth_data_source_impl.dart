import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:mercado_v2/core/result/failure.dart';
import 'package:mercado_v2/features/auth/data/datasources/iauth_remote_data_source.dart';
import 'package:mercado_v2/features/auth/data/mappers/auth_user_mapper.dart';
import 'package:mercado_v2/features/auth/domain/entities/auth_user/auth_user.dart';

class FirebaseAuthDataSourceImpl implements IAuthRemoteDataSource {
  final fb.FirebaseAuth _firebaseAuth;
  final AuthUserMapper _mapper;

  FirebaseAuthDataSourceImpl({
    required fb.FirebaseAuth firebaseAuth,
    required AuthUserMapper mapper,
  }) : _mapper = mapper,
       _firebaseAuth = firebaseAuth;

  @override
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        throw AuthException('AuthUser is null after signIn');
      }
      return _mapper.fromFirebase(user);
    } catch (e) {
      // TODO crashlytics
      throw AuthException(
        'Ha ocurrido un error iniciando sesión. Por favor inténtalo otra vez',
      );
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<AuthUser> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user == null) {
        throw AuthException('AuthUser is null after creating account.');
      }
      return _mapper.fromFirebase(user);
    } catch (e) {
      throw AuthException(
        'Ha ocurrido un error creando la cuenta. Por favor inténtalo otra vez',
      );
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
    } catch (e) {
      throw AuthException(
        'Ha ocurrido un error en el envío del correo de verificación. Por favor inténtalo otra vez',
      );
    }
  }

  @override
  Future<bool> isEmailVerified() async {
    try {
      await _firebaseAuth.currentUser?.reload();
      return _firebaseAuth.currentUser?.emailVerified ?? false;
    } catch (e) {
      throw AuthException('Error verifying email');
    }
  }

  @override
  AuthUser? getCurrentUser() {
    final user = _firebaseAuth.currentUser;
    try {
      if (user == null) {
        return null;
      }
      return _mapper.fromFirebase(user);
    } catch (e) {
      throw AuthException('Error retrieving user');
    }
  }

  @override
  Future<void> refreshCurrentUser() async {
    try {
      await _firebaseAuth.currentUser?.getIdToken(true);
    } catch (e) {
      throw AuthException('Error refreshing current user');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw AuthException('Error signing out');
    }
  }

  Stream<AuthUser?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? null : AuthUser(uid: firebaseUser.uid);
    });
  }
}
