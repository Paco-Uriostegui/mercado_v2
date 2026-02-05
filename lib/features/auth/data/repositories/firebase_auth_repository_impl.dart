import 'package:mercado_v2/app/core/result/failure.dart';
import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/data/datasources/iauth_remote_data_source.dart';
import 'package:mercado_v2/features/auth/domain/entities/auth_user/auth_user.dart';
import 'package:mercado_v2/features/auth/domain/repositories/iauth_repository.dart';

class FirebaseAuthRepositoryImpl implements IAuthRepository {
  final IAuthRemoteDataSource _authRemoteDataSource;

  FirebaseAuthRepositoryImpl({
    required IAuthRemoteDataSource authRemoteDataSource,
  }) : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<Result<AuthUser>> tryCreateUserWithEmailAndPassword(
    String email,
    String password,
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
  Future<void> trySendEmailVerification() {
    // TODO: implement trySendEmailVerification
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> trySendPasswordResetEmail(String email) {
    // TODO: implement trySendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<Result<AuthUser>> trySignInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final authUser = await _authRemoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Result.success(authUser);
    } on AuthException catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(UnknownException());
    }
  }

  @override
  Future<Result<void>> trySignOut() {
    // TODO: implement trySignOut
    throw UnimplementedError();
  }

  @override
  Future<Result<bool>> tryVerifyEmail() {
    // TODO: implement tryVerifyEmail
    throw UnimplementedError();
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
        throw AuthException("");
      });
    } catch (e) {
      // TODO reportar a crashlytics
      throw AuthException("");
    }
  }
}
