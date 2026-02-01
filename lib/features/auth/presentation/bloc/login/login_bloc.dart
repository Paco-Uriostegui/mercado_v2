import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercado_v2/core/result/result.dart';
import 'package:mercado_v2/features/auth/domain/usecases/login_usecase.dart';
import 'package:mercado_v2/features/auth/presentation/bloc/login/login_event.dart';
import 'package:mercado_v2/features/auth/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase _loginUsecase;

  LoginBloc(this._loginUsecase) : super(LoginState.initial()) {
    on<LoginSubmitted>(_loginSubmitted);
  }

  Future<void> _loginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(.loading());
    final result = await _loginUsecase(
      email: event.email,
      password: event.password,
    );
    result.when(
      success: (value) {
        // TODO navegar a splash screen. La splashScreen tendrá centralizada la búsqueda del User usando el AuthUser
        // para así no duplicar código
      },
      failure: (failure) {
        emit(.failure(failure));
      },
    );
  }
}
