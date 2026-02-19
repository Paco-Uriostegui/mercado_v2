import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/iauth_gate.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/authenticate_usecase.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/auth_gate/auth_gate_bloc.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/auth_gate/auth_gate_event.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/auth_gate/auth_gate_state.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mocks.mocks.dart';

void main() {
  late MockAuthenticationUseCase mockUseCase;
  late AuthenticationStatus? capturedStatus;
  late StreamSubscription<AuthenticationStatus> streamSubs;
  group("AuthGate bloc tests", () {
    setUp(() {
      capturedStatus = null;

      mockUseCase = MockAuthenticationUseCase();
    });
    blocTest<AuthGateBloc, AuthGateState>(
      "Test 2: Emits [goToLogin] when AuthUser is null",
      setUp: () {
        when(
          mockUseCase.execute(),
        ).thenAnswer((_) => Stream<AuthUserStatus>.value(AuthUserUnlogged()));
      },
      build: () => AuthGateBloc(mockUseCase),

      act: (bloc) => bloc.add(InitStream()),

      expect: () => <AuthGateState>[
        //AuthGateState.loading(),
        AuthGateState.goToLogin(),
      ],
      //expect(AuthGateState, AuthGateState.goToLogin());
      verify: (_) {
        verify(mockUseCase.execute()).called(1);
      },
    );

    blocTest(
      "Test 3: Emits [GoToVerify] when AuthUser's email is not verified ",
      setUp: () {
        when(mockUseCase.execute()).thenAnswer(
          (_) => Stream<AuthUserStatus>.value(AuthUserNotVerified()),
        );
      },
      build: () => AuthGateBloc(mockUseCase),

      act: (bloc) => bloc.add(InitStream()),

      expect: () => <AuthGateState>[AuthGateState.goToVerifyEmail()],
      verify: (_) => verify(mockUseCase.execute()).called(1),
    );

    blocTest(
      "Test 4: Add AuthenticationSuccess() to stream when AuthUser is complete",
      setUp: () {
        when(
          mockUseCase.execute(),
        ).thenAnswer((_) => Stream<AuthUserStatus>.value(AuthUserComplete()));
      },
      build: () => AuthGateBloc(mockUseCase),

      act: (bloc) async {
        final completer = Completer<AuthenticationStatus>();
        streamSubs = bloc.authenticationGateStream.listen((value) {
          if (!completer.isCompleted) completer.complete(value);
        });
        bloc.add(InitStream());
        capturedStatus = await completer.future;
      },

      expect: () => [],
      verify: (_) {
        verify(mockUseCase.execute()).called(1);
        expect(capturedStatus, isA<AuthenticationSuccess>());
      },
    );

    //
  });
}
