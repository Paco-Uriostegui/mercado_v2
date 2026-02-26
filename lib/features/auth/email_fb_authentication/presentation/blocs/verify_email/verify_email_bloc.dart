import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/i_auth_gate.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/confirm_email_verification_usecase.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/resend_verification_email_usecase.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/verify_email/verify_email_event.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/verify_email/verify_email_state.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  final ConfirmEmailVerificationUseCase _confirmEmailVerificationUseCase;
  final IAuthGateStream _authGateStream;
  final ResendVerificationEmailUsecase _resendVerificationEmailUseCase;

  VerifyEmailBloc({
    required IAuthGateStream authGateStream,
    required ConfirmEmailVerificationUseCase confirmEmailVerificationUseCase,
    required ResendVerificationEmailUsecase resendVerificationEmailUseCase,
  }) : _authGateStream = authGateStream,
       _confirmEmailVerificationUseCase = confirmEmailVerificationUseCase,
       _resendVerificationEmailUseCase = resendVerificationEmailUseCase,
       super(VerifyEmailState.inital()) {
    on<OnVerifiedPressed>(_onVerifiedPressed);
    on<ResendVerificationEmail>(_onResendVerificationEmail);
  }

  Future<void> _onVerifiedPressed(
    VerifyEmailEvent event,
    Emitter<VerifyEmailState> emit,
  ) async {
    final Result<bool, AuthFailure> result = await _confirmEmailVerificationUseCase();
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

  Future<void> _onResendVerificationEmail(
    VerifyEmailEvent event,
    Emitter<VerifyEmailState> emit,
  ) async {
    await _resendVerificationEmailUseCase();
  }
}
