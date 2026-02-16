import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/entities/auth_user/new_auth_user.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/repositories/newiauth_repository.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/value_objects/newemail.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/value_objects/newpassword.dart';

class NewFirebaseAuthRepositoryImpl implements NewIAuthRepository {
  final IAuthRemoteDataSource _authRemoteDataSource;

  NewFirebaseAuthRepositoryImpl({
    required IAuthRemoteDataSource authRemoteDataSource,
  }) : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<Result<void>> tryCreateUserWithEmailAndPassword(
    NewEmail email,
    NewPassword password,
  ) {
    // TODO: implement tryCreateUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Result<NewAuthUser?>> tryGetCurrentUser() async {
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
  Future<Result<void>> trySendPasswordResetEmail(String email) {
    // TODO: implement trySendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<Result<NewAuthUser>> trySignInWithEmailAndPassword(
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
  Future<Result<NewAuthUser?>> tryGetRefreshedCurrentUser() async {
    try {
      final NewAuthUser? authUser = _authRemoteDataSource.getCurrentUser();
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
  Stream<NewAuthUser?> onStateChanges() {
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
  Future<Result<void>> tryUpdateDisplayName(String firstName,String lastName, String secondLastName) async {
    try {
      final String name = "$firstName $lastName $secondLastName";
      await _authRemoteDataSource.updateDisplayName(name);
      return Result.success(null);
    } catch (e) {
      return Result.failure(UpdateDisplayNameException());
    }
  }


}