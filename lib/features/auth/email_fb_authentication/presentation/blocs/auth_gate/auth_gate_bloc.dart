import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/iauth_gate.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/authenticate_usecase.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/auth_gate/auth_gate_event.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/auth_gate/auth_gate_state.dart';

class AuthGateBloc extends Bloc<AuthGateEvent, AuthGateState>
    implements IAuthGateStream {
  final StreamController<AuthenticationStatus> _controller =
      StreamController<AuthenticationStatus>();
  late StreamSubscription<AuthUserStatus> _subscription;
  final AuthenticationUseCase _usecase;

  AuthGateBloc(AuthenticationUseCase usecase)
    : _usecase = usecase,
      super(AuthGateState.loading()) {
    on<InitStream>(_onInitStream);
  }

  @override
  Stream<AuthenticationStatus> get authenticationGateStream =>
      _controller.stream;

  Future<void> _onInitStream(
    AuthGateEvent event,
    Emitter<AuthGateState> emit,
  ) async {
    _subscription = _usecase.call().listen((response) {
      switch (response) {
        case AuthUserComplete():
          _controller.sink.add(AuthenticationSuccess());
          break;
        case AuthUserNotVerified():
          emit(.goToVerifyEmail());
          break;
        case AuthUserUnlogged():
          emit(.goToLogin());
          break;
      }
    });
  }

  @override
  Future<void> close() {
    _controller.close();
    _subscription.cancel();
    return super.close();
  }

  @override
  void initialize() {
    add(AuthGateEvent.initStream());
  }

  @override
  void manualAuthenticationSuccessStreamSinkAdd() {
    _controller.sink.add(AuthenticationSuccess());
  }
}
