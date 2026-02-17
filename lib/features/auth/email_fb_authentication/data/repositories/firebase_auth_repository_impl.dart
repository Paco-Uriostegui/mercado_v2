import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/data/datasources/iauth_remote_datasource.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/entities/auth_user/auth_user.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/iauth_repository.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/value_objects/email.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/value_objects/password.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/value_objects/value_objects_export.dart';

class FirebaseAuthRepositoryImpl implements IAuthRepository {
  final IAuthRemoteDataSource _authRemoteDataSource;

  FirebaseAuthRepositoryImpl({
    required IAuthRemoteDataSource authRemoteDataSource,
  }) : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<Result<void>> tryCreateUserWithEmailAndPassword(
    Email email,
    Password password,
  ) {
    // TODO: implement tryCreateUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Result<AuthUser?>> tryGetCurrentUser() async {
    final user = _authRemoteDataSource.getCurrentUser();

    try {
      if (user == null) {
        return Result.success(null);
      }
      return Result.success(user);
    } catch (e) {
      return Result.failure(GetCurrentUserException());
    }
  }

  @override
  Future<Result<void>> tryRefreshCurrentUser() {
    // TODO: implement tryRefreshCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<void> trySendEmailVerification() async {
    await _authRemoteDataSource.sendEmailVerification();
  }

  @override
  Future<Result<void>> trySendPasswordResetEmail(Email email) {
    // TODO: implement trySendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> trySignInWithEmailAndPassword(
    Email email,
    Password password,
  ) async {
    try {
      await _authRemoteDataSource.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      return Result.success(null);

    } catch (e) {
      return Result.failure(e as Failure);
    }
  }

  @override
  Future<Result<void>> trySignOut() {
    // TODO: implement trySignOut
    throw UnimplementedError();
  }

  @override
  Future<Result<bool>> tryIsEmailVerified() async {
    try {
      final response = await _authRemoteDataSource.isEmailVerified();
      return Result.success(response);
    } catch (e) {
      return Result.failure(e as Failure);
    }
  }

  @override
  Future<Result<AuthUser?>> tryGetRefreshedCurrentUser() async {
    try {
      final AuthUser? authUser = _authRemoteDataSource.getCurrentUser();
      if (authUser == null) {
        return Result.success(null);
      }
      await _authRemoteDataSource.refreshCurrentUser();
      return Result.success(authUser);
    } catch (e) {
      // TODO reportar a crashlytics
      return Result.failure(GetCurrentUserException());
    }
  }

  @override
  Stream<AuthUser?> onStateChanges() {
    try {
      return _authRemoteDataSource.authStateChanges().handleError((e) {
        // TODO reportar a crashlytics
        // investigar si el error viaja y llega como data hasta el bloc
        throw AuthException();
      });
    } catch (e) {
      // TODO reportar a crashlytics
      throw AuthException();
    }
  }

  @override
  Future<Result<void>> tryUpdateDisplayName(
    FirstName firstName,
    LastName lastName,
    SecondLastName secondLastName,
  ) async {
    try {
      final String name =
          "${firstName.value} ${lastName.value} ${secondLastName.value}";
      await _authRemoteDataSource.updateDisplayName(name);
      return Result.success(null);
    } catch (e) {
      return Result.failure(UpdateDisplayNameException());
    }
  }
}
