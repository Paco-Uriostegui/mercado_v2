import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/repositories/newiauth_gate.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/usecases/newauthenticate_usecase.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/presentation/blocs/auth_gate/newauth_gate_event.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/presentation/blocs/auth_gate/newauth_gate_state.dart';

class NewauthGateBloc extends Bloc<NewAuthGateEvent, NewAuthGateState>
    implements NewIAuthGateStream {
  final StreamController<NewAuthenticationStatus> _controller =
      StreamController<NewAuthenticationStatus>();
  late StreamSubscription<AuthUserStatus> _subscription;
  final AuthenticationUseCase _usecase;

  NewauthGateBloc(AuthenticationUseCase usecase)
    : _usecase = usecase,
      super(NewAuthGateState.loading()) {
    on<InitStream>(_onInitStream);
  }

  @override
  Stream<NewAuthenticationStatus> get authenticationGateStream =>
      _controller.stream;

  Future<void> _onInitStream(
    NewAuthGateEvent event,
    Emitter<NewAuthGateState> emit,
  ) async {
    _subscription = _usecase.execute().listen((response) {
      switch (response) {
        case AuthUserCompleted():
          _controller.sink.add(AuthenticationSuccess());
          break;
        case AuthUserUnverified():
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
    add(NewAuthGateEvent.initStream());
  }

  @override
  void manualAuthenticationSuccessStreamSinkAdd() {
    _controller.sink.add(AuthenticationSuccess());
  }
}
