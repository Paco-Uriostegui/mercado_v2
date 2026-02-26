import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/login_usecase.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/login/login_event.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase _loginUsecase;

  LoginBloc(this._loginUsecase) : super(LoginState.initial()) {
    on<NewLoginSubmitted>(_loginSubmitted);
  }

  Future<void> _loginSubmitted(
    NewLoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(.loading());
    final result = await _loginUsecase(
      email: event.email,
      password: event.password,
    );
    result.when(
      success: (_) {
        emit(.success());
      },
      failure: (failure) {
        emit( switch (failure) {

          InvalidEmailFormatFailure() => .invalidEmailFormat(),
          UserNotFoundFailure() => .userNotFound(),
          OperationNotAllowedFailure() => .operationNotAllowed(),
          TooManyRequestsFailure() => .tooManyAttempts(),
          BackendUserIsNullFailure() => .unknown(),
          NetworkRequestFailedFailure() => .networkError(),
          UserDisabledFailure() => .userDisabled(),
          InvalidLoginCredentialsFailure() => .invalidLoginCredentials(),
          InvalidPasswordFormatFailure() => .invalidPasswordFormat(),
          WrongPasswordFailure() => .wrongPassword(),
          _ => .unknown(),
        });
      },
    );
  }
}
