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
  group("AuthGate bloc tests", () {
    setUp(() {
      mockUseCase = MockAuthenticationUseCase();
    });
    blocTest<AuthGateBloc, AuthGateState>(
      "Test 3: Emits [Loading, goToLogin] when AuthUser is null",
      build: () {
        when(
          mockUseCase.call(),
        ).thenAnswer((_) => Stream<AuthUserStatus>.value(AuthUserUnlogged()));
        return AuthGateBloc(mockUseCase);
      },

      act: (bloc) => bloc.add(InitStream()),

      expect: () =>
        [
          AuthGateState.loading(),
          AuthGateState.goToLogin(),
        ]
        //expect(AuthGateState, AuthGateState.goToLogin());
      ,
      verify: (_) {
        verify(mockUseCase).called(1);
      },
    );
    //
  });
}
