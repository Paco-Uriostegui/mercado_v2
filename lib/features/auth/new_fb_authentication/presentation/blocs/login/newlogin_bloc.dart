import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/usecases/newlogin_usecase.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/presentation/blocs/login/newlogin_event.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/presentation/blocs/login/newlogin_state.dart';

class NewLoginBloc extends Bloc<NewLoginEvent, NewLoginState> {
  final NewLoginUsecase _loginUsecase;

  NewLoginBloc(this._loginUsecase) : super(NewLoginState.initial()) {
    on<NewLoginSubmitted>(_loginSubmitted);
  }

  Future<void> _loginSubmitted(
    NewLoginSubmitted event,
    Emitter<NewLoginState> emit,
  ) async {
    emit(.loading());
    final result = await _loginUsecase(
      email: event.email,
      password: event.password,
    );
    result.when(
      success: (value) {
        // TODO authUser válido. Guardarlo en el state global del user y navegar a splash screen. La splashScreen tendrá centralizada la búsqueda del User usando el AuthUser
        // para así no duplicar código
      },
      failure: (failure) {
        emit(.failure(failure));
      },
    );
  }
}