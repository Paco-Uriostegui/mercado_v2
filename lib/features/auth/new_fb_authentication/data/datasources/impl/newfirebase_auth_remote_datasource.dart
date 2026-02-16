import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:mercado_v2/app/core/result/failure.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/data/datasources/newiauth_remote_datasource.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/data/mappers/newauth_user_mapper.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/entities/auth_user/new_auth_user.dart';

class NewFirebaseAuthDataSourceImpl implements NewIAuthRemoteDataSource {
  final fb.FirebaseAuth _firebaseAuth;
  final NewAuthUserMapper _mapper;

  NewFirebaseAuthDataSourceImpl({
    required fb.FirebaseAuth firebaseAuth,
    required NewAuthUserMapper mapper,
  }) : _mapper = mapper,
       _firebaseAuth = firebaseAuth;

  @override
  Future<NewAuthUser> signInWithEmailAndPassword({
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
        throw AuthException();
      }
      return _mapper.fromFirebase(user);
    } catch (e) {
      // TODO crashlytics
      throw AuthException();
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<NewAuthUser> createUserWithEmailAndPassword({
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
        throw AuthException();
      }
      return _mapper.fromFirebase(user);
    } catch (e) {
      throw AuthException();
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
    } catch (e) {
      // TODO reportar a crashlytics  

    }
  }

  @override
  Future<bool> isEmailVerified() async {
    try {
      await _firebaseAuth.currentUser?.reload();
      return _firebaseAuth.currentUser?.emailVerified ?? false;
    } catch (e) {
      throw IsEmailVerifiedException();
    }
  }

  @override
  NewAuthUser? getCurrentUser() {
    final user = _firebaseAuth.currentUser;
    try {
      if (user == null) {
        return null;
      }
      return _mapper.fromFirebase(user);
    } catch (e) {
      throw AuthException();
    }
  }

  @override
  Future<void> refreshCurrentUser() async {
    try {
      await _firebaseAuth.currentUser?.getIdToken(true);
    } catch (e) {
      throw AuthException();
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw AuthException();
    }
  }

  @override
  Stream<NewAuthUser?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? null : NewAuthUser(uid: firebaseUser.uid, isEmailVerified: firebaseUser.emailVerified, name: firebaseUser.displayName);
    });
  }

  @override
  Future<void> updateDisplayName(String name) async {
    try {
      await _firebaseAuth.currentUser?.updateDisplayName(name);
    } catch (e) {
      // TODO reportar a crashlytics
      throw UpdateDisplayNameException();      
    }
  }

}