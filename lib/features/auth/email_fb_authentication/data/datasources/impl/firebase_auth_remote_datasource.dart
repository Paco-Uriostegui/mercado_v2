import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:mercado_v2/app/core/error/app_exceptions.dart';
import 'package:mercado_v2/app/core/error/failure.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/data/datasources/i_auth_remote_datasource.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/data/mappers/auth_user_mapper.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/data/mappers/firebase_error_handler.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/entities/auth_user/auth_user.dart';

class FirebaseAuthDataSourceImpl implements IAuthRemoteDataSource {
  final FirebaseErrorHandler _errorHandler;
  final fb.FirebaseAuth _firebaseAuth;
  final AuthUserMapper _userMapper;

  FirebaseAuthDataSourceImpl({
    required FirebaseErrorHandler errorHandler,
    required fb.FirebaseAuth firebaseAuth,
    required AuthUserMapper userMapper,
  }) : _errorHandler = errorHandler,
       _firebaseAuth = firebaseAuth,
       _userMapper = userMapper;

  @override
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _guard(() async {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        throw BackendUserIsNullException();
      }
      return _userMapper.fromFirebase(firebaseUser);
    }, "SignIn");

    // try {

    // } on fb.FirebaseAuthException catch (e) {
    //   //
    //   throw _exceptionMapper.mapToAppException(e);
    // }
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
    return _guard(() async {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        throw BackendUserIsNullException();
      }
      return _userMapper.fromFirebase(firebaseUser);
    }, "CreateUser");
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
      return _userMapper.fromFirebase(user);
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

  Future<T> _guard<T>(Future<T> Function() action, String operation) async {
    try {
      return await action();
    } catch (e, st) {
      throw _errorHandler.handle(e, st, operation);
    }
  }
}
