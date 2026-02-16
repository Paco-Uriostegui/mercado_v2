import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/repositories/newiauth_gate.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/usecases/confirm_email_verification_usecase.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/presentation/blocs/verify_email/verify_email_event.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/presentation/blocs/verify_email/verify_email_state.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  final ConfirmEmailVerificationUseCase _usecase;
  final NewIAuthGateStream _authGateStream;

  VerifyEmailBloc({
    required NewIAuthGateStream authGateStream,
    required ConfirmEmailVerificationUseCase usecase,
  }) : _authGateStream = authGateStream,
       _usecase = usecase,
       super(VerifyEmailState.inital()) {
    on<OnVerifiedPressed>(_onVerifiedPressed);
    on<ResendVerificationEmail>(_onResendVerificationEmail);
  }

  Future<void> _onVerifiedPressed(
    VerifyEmailEvent event,
    Emitter<VerifyEmailState> emit,
  ) async {
    final Result<bool> result = await _usecase();
    result.when(
      success: (value) {
        if (value) {
          _authGateStream.manualAuthenticationSuccessStreamSinkAdd();
        } else {
          emit(.notVerifiedYetMessage());
        }
      },
      failure: (failure) {
        emit(.error());
      },
    );
  }

  void _onResendVerificationEmail() {
    // TODO 
  }


}
