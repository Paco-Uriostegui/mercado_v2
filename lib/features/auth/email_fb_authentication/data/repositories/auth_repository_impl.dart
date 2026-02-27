import 'package:mercado_v2/app/core/error/data_exceptions.dart';
import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/data/datasources/i_auth_remote_datasource.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/data/models/auth_user_model.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/entities/auth_user/auth_user.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/mappers/data_exception_mapper.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/i_auth_repository.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/value_objects/value_objects_export.dart';

class FirebaseAuthRepositoryImpl implements IAuthRepository {
  final IAuthRemoteDataSource _authRemoteDataSource;
  final DataExceptionMapper _dataExceptionMapper;

  FirebaseAuthRepositoryImpl({
    required IAuthRemoteDataSource authRemoteDataSource,
    required DataExceptionMapper dataExceptionMapper,
  }) : _authRemoteDataSource = authRemoteDataSource,
       _dataExceptionMapper = dataExceptionMapper;

  // ---------------------------------------------------------------------------- tryCreateUserWithEmailAndPassword
  @override
  Future<Result<void, AuthFailure>> tryCreateUserWithEmailAndPassword(
    Email email,
    Password password,
  ) async {
    try {
      await _authRemoteDataSource.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      return Result.success(null);
    } on AuthException catch (authException) {
      return Result.failure(
        _dataExceptionMapper.fromAuthException(authException),
      );
    } catch (e) {
      return Result.failure(UnknownAuthFailure());
    }
  }

  // ---------------------------------------------------------------------------- tryGetCurrentUser
  // @override
  // Future<Result<AuthUser?, AuthFailure>> tryGetCurrentUser() async {
  //   final user = _authRemoteDataSource.getCurrentUser();

  //   try {
  //     if (user == null) {
  //       return Result.success(null);
  //     }
  //     return Result.success(user);
  //   } on AuthException catch (authException) {
  //     return _dataExceptionMapper.fromAuthException(authException);
  //   } catch (e) {
  //     return Result.failure(UnknownAuthFailure());
  //   }
  // }

  // ---------------------------------------------------------------------------- tryRefreshCurrentUser
  // @override
  // Future<Result<void, AuthFailure>> tryRefreshCurrentUser() {
  //   // TODO: implement tryRefreshCurrentUser
  //   throw UnimplementedError();
  // }

  // ---------------------------------------------------------------------------- trySendVerificationEmail
  @override
  Future<Result<void, AuthFailure>> trySendVerificationEmail() async {
    try {
      await _authRemoteDataSource.sendVerificationEmail();
      return Result.success(null);
    } on AuthException catch (authException) {
      return Result.failure(
        _dataExceptionMapper.fromAuthException(authException),
      );
    } catch (e) {
      return Result.failure(UnknownAuthFailure());
    }
  }
  // ---------------------------------------------------------------------------- trySendPasswordResetEmail
  // @override
  // Future<Result<void, AuthFailure>> trySendPasswordResetEmail(Email email) {
  //   // TODO: implement trySendPasswordResetEmail
  //   throw UnimplementedError();
  // }

  // ------------------------------------------------------------------------------- trySignInWithEmailAndPassword
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
    } on AuthException catch (authException) {
      return Result.failure(
        _dataExceptionMapper.fromAuthException(authException),
      );
    } catch (e) {
      return Result.failure(UnknownAuthFailure());
    }
  }

  // ---------------------------------------------------------------------------- trySignOut
  // @override
  // Future<Result<void, AuthFailure>> trySignOut() {
  //   // TODO: implement trySignOut
  //   throw UnimplementedError();
  // }

  // ---------------------------------------------------------------------------- tryIsEmailVerified
  @override
  Future<Result<bool, AuthFailure>> tryIsEmailVerified() async {
    try {
      return Result.success(await _authRemoteDataSource.isEmailVerified());
    } on AuthFailure catch (authFailure) {
      return Result.failure(authFailure);
    } catch (e) {
      return Result.failure(UnknownAuthFailure());
    }
  }

  // ---------------------------------------------------------------------------- tryGetRefreshedCurrentUser
  // @override
  // Future<Result<AuthUser?, AuthFailure>> tryGetRefreshedCurrentUser() async {
  //   try {
  //     final AuthUser? authUser = _authRemoteDataSource.getCurrentUser();
  //     if (authUser == null) {
  //       return Result.success(null);
  //     }
  //     await _authRemoteDataSource.refreshCurrentUser();
  //     return Result.success(authUser);
  //   } catch (e) {
  //     // TODO reportar a crashlytics
  //     return Result.failure(AuthFailure());
  //   }
  // }

  // ---------------------------------------------------------------------------- onAuthStateChanges
  @override
  Stream<AuthUser?> onStateChanges() {
    return _authRemoteDataSource.authStateChanges();
  }

  // ---------------------------------------------------------------------------- tryUpdateDisplayName
  // @override
  // Future<Result<void, AuthFailure>> tryUpdateDisplayName(
  //   FirstName firstName,
  //   LastName lastName,
  //   SecondLastName secondLastName,
  // ) async {
  //   try {
  //     final String name =
  //         "${firstName.value} ${lastName.value} ${secondLastName.value}";
  //     await _authRemoteDataSource.updateDisplayName(name);
  //     return Result.success(null);
  //   } catch (e) {
  //     return Result.failure(AuthFailure());
  //   }
  // }
}
