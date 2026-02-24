import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/data/datasources/i_auth_remote_datasource.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/entities/auth_user/auth_user.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/i_auth_repository.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/value_objects/value_objects_export.dart';

class FirebaseAuthRepositoryImpl implements IAuthRepository {
  final IAuthRemoteDataSource _authRemoteDataSource;

  FirebaseAuthRepositoryImpl({
    required IAuthRemoteDataSource authRemoteDataSource,
  }) : _authRemoteDataSource = authRemoteDataSource;

  // ---------------------------------------------------------------------------- createAccount
  @override
  Future<Result<void, CreateAccountFailure>> tryCreateUserWithEmailAndPassword(
    Email email,
    Password password,
  ) {
    // TODO: implement tryCreateUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Result<AuthUser?, AuthFailure>> tryGetCurrentUser() async {
    final user = _authRemoteDataSource.getCurrentUser();

    try {
      if (user == null) {
        return Result.success(null);
      }
      return Result.success(user);
    } catch (e) {
      return Result.failure(AuthFailure());
    }
  }

  @override
  Future<Result<void, AuthFailure>> tryRefreshCurrentUser() {
    // TODO: implement tryRefreshCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<void> trySendEmailVerification() async {
    await _authRemoteDataSource.sendEmailVerification();
  }

  @override
  Future<Result<void, AuthFailure>> trySendPasswordResetEmail(Email email) {
    // TODO: implement trySendPasswordResetEmail
    throw UnimplementedError();
  }
  // ------------------------------------------------------------------------------- SignIn
  @override
  Future<Result<void, AuthFailure>> trySignInWithEmailAndPassword(
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
      return Result.failure(SignInException());
    }
  }

  @override
  Future<Result<void, AuthFailure>> trySignOut() {
    // TODO: implement trySignOut
    throw UnimplementedError();
  }

  @override
  Future<Result<bool, AuthFailure>> tryIsEmailVerified() async {
    try {
      final response = await _authRemoteDataSource.isEmailVerified();
      return Result.success(response);
    } catch (e) {
      return Result.failure(AuthFailure());
    }
  }

  @override
  Future<Result<AuthUser?, AuthFailure>> tryGetRefreshedCurrentUser() async {
    try {
      final AuthUser? authUser = _authRemoteDataSource.getCurrentUser();
      if (authUser == null) {
        return Result.success(null);
      }
      await _authRemoteDataSource.refreshCurrentUser();
      return Result.success(authUser);
    } catch (e) {
      // TODO reportar a crashlytics
      return Result.failure(AuthFailure());
    }
  }

  @override
  Stream<AuthUser?> onStateChanges() {
    try {
      return _authRemoteDataSource.authStateChanges().handleError((e) {
        // TODO reportar a crashlytics
        // investigar si el error viaja y llega como data hasta el bloc
        throw AuthFailure();
      });
    } catch (e) {
      // TODO reportar a crashlytics
      throw AuthFailure();
    }
  }

  @override
  Future<Result<void, AuthFailure>> tryUpdateDisplayName(
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
      return Result.failure(AuthFailure());
    }
  }
}
