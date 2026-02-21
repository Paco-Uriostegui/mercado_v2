import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:mercado_v2/app/core/data/failure.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/data/datasources/i_auth_remote_datasource.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/data/mappers/auth_user_mapper.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/entities/auth_user/auth_user.dart';

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
        throw AuthFailure();
      }
      return _mapper.fromFirebase(user);
    } catch (e) {
      // TODO crashlytics
      throw SignInException();
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
        throw AuthFailure();
      }
      return _mapper.fromFirebase(user);
    } catch (e) {
      throw AuthFailure();
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
    } catch (e) {
      // TODO reportar a crashlytics
      //throw SendEmailVerificationException();
    }
  }

  @override
  Future<bool> isEmailVerified() async {
    try {
      await _firebaseAuth.currentUser?.reload();
      return _firebaseAuth.currentUser?.emailVerified ?? false;
    } catch (e) {
      throw IsEmailVerifiedFailure();
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
      throw AuthFailure();
    }
  }

  @override
  Future<void> refreshCurrentUser() async {
    try {
      await _firebaseAuth.currentUser?.getIdToken(true);
    } catch (e) {
      throw AuthFailure();
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw AuthFailure();
    }
  }

  @override
  Stream<AuthUser?> authStateChanges() {
    return _firebaseAuth.authStateChanges().transform(
      StreamTransformer<fb.User?, AuthUser?>.fromHandlers(
        handleData: (firebaseUser, sink) {
          sink.add(
            firebaseUser == null
                ? null
                : AuthUser(
                    uid: firebaseUser.uid,
                    name: firebaseUser.displayName,
                    isEmailVerified: firebaseUser.emailVerified,
                  ),
          );
        },
        handleError: (error, stackTrace, sink) {
          // TODO report error y strackTRace
          sink.add(null);
        },
      ),
    );
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
