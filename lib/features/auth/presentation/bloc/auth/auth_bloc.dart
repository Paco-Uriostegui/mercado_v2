import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercado_v2/features/auth/domain/entities/auth_user/auth_user.dart';
import 'package:mercado_v2/features/auth/domain/repositories/iauth_repository.dart';
import 'package:mercado_v2/features/auth/presentation/bloc/auth/auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  final IAuthRepository _authRepository;
  late StreamSubscription<AuthUser?> _streamSubscription;

  AuthBloc(this._authRepository) : super(AuthState.loading()) {
    _streamSubscription = _authRepository.onStateChanges().listen(
      (authUser) {
        if (authUser != null) {
          if (authUser.isEmailVerified) {
            if (authUser.isProfileCompleted == true) {
              emit(.authenticated());
            } else {
              emit(.authenticatedUnnamed());
            }
          } else {
            emit(.authenticatedUnverified());
          }
        } else {
          emit(.notAuthenticated());
        }
      },
      onError: (e, stackTrace) {
        // TODO reportar a crashlytics
        // gestionar error posiblemente, no emitir nada
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
