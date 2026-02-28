import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/verify_email/verify_email_bloc.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/verify_email/verify_email_event.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/verify_email/verify_email_state.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mocks.mocks.dart';

void main() {
  provideDummy<Result<bool, AuthFailure>>(Success(true));

  group("VerifyEmail Bloc tests", () {
    late MockConfirmEmailVerificationUseCase mockConfirmEmailVerificationUseCase;
    late MockResendVerificationEmailUsecase mockResendVerificationEmailUsecase;
    late MockIAuthGateStream mockAuthGateStream;

    setUp(() {
      mockConfirmEmailVerificationUseCase = MockConfirmEmailVerificationUseCase();
      mockResendVerificationEmailUsecase = MockResendVerificationEmailUsecase();
      mockAuthGateStream = MockIAuthGateStream();
    });

    blocTest(
      "Test 1: Emits [notVerifiedYetMessage] when email is not verified yet",
      setUp: () {
        when(mockConfirmEmailVerificationUseCase()).thenAnswer(
          (_) async => Result.success(false),
        );
      },
      build: () => VerifyEmailBloc(
        authGateStream: mockAuthGateStream,
        confirmEmailVerificationUseCase: mockConfirmEmailVerificationUseCase,
        resendVerificationEmailUseCase: mockResendVerificationEmailUsecase,
      ),
      act: (bloc) => bloc.add(const VerifyEmailEvent.onVerifiedPressed()),
      expect: () => <VerifyEmailState>[
        const VerifyEmailState.notVerifiedYetMessage(),
      ],
      verify: (_) {
        verify(mockConfirmEmailVerificationUseCase()).called(1);
      },
    );

    blocTest(
      "Test 2: Emits [error] when email verification fails",
      setUp: () {
        when(mockConfirmEmailVerificationUseCase()).thenAnswer(
          (_) async => Result.failure(UnknownAuthFailure()),
        );
      },
      build: () => VerifyEmailBloc(
        authGateStream: mockAuthGateStream,
        confirmEmailVerificationUseCase: mockConfirmEmailVerificationUseCase,
        resendVerificationEmailUseCase: mockResendVerificationEmailUsecase,
      ),
      act: (bloc) => bloc.add(const VerifyEmailEvent.onVerifiedPressed()),
      expect: () => <VerifyEmailState>[
        const VerifyEmailState.error(),
      ],
      verify: (_) {
        verify(mockConfirmEmailVerificationUseCase()).called(1);
      },
    );

    blocTest(
      "Test 3: Calls authGateStream when email is verified successfully",
      setUp: () {
        when(mockConfirmEmailVerificationUseCase()).thenAnswer(
          (_) async => Result.success(true),
        );
      },
      build: () => VerifyEmailBloc(
        authGateStream: mockAuthGateStream,
        confirmEmailVerificationUseCase: mockConfirmEmailVerificationUseCase,
        resendVerificationEmailUseCase: mockResendVerificationEmailUsecase,
      ),
      act: (bloc) => bloc.add(const VerifyEmailEvent.onVerifiedPressed()),
      expect: () => <VerifyEmailState>[],
      verify: (_) {
        verify(mockConfirmEmailVerificationUseCase()).called(1);
        verify(mockAuthGateStream.manualAuthenticationSuccessStreamSinkAdd())
            .called(1);
      },
    );

    blocTest(
      "Test 4: Emits [emailSent] when resend verification email is called",
      setUp: () {
        when(mockResendVerificationEmailUsecase()).thenAnswer((_) async {});
      },
      build: () => VerifyEmailBloc(
        authGateStream: mockAuthGateStream,
        confirmEmailVerificationUseCase: mockConfirmEmailVerificationUseCase,
        resendVerificationEmailUseCase: mockResendVerificationEmailUsecase,
      ),
      act: (bloc) =>
          bloc.add(const VerifyEmailEvent.resendVerificationEmail()),
      expect: () => <VerifyEmailState>[
        const VerifyEmailState.emailSent(),
      ],
      verify: (_) {
        verify(mockResendVerificationEmailUsecase()).called(1);
      },
    );
  });
}
