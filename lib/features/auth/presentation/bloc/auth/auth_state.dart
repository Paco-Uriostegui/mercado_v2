
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mercado_v2/features/auth/domain/entities/auth_user/auth_user.dart';

part 'auth_state.freezed.dart';

@freezed 
sealed class AuthState with _$AuthState{
  const factory AuthState.authenticated(AuthUser authUser) = _Authenticated;
  const factory AuthState.authenticatedWithNoVerification(AuthUser authUser) = _AuthenticatedWithNoVerification;
  const factory AuthState.notAuthenticated() = _NotAuthenticated;
  const factory AuthState.loading() = _Loading;
}