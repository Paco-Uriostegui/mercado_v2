import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/authenticate_usecase.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/auth_gate/auth_gate_bloc.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/auth_gate/auth_gate_event.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/auth_gate/auth_gate_state.dart';

import '../../mocks/mocks.mocks.dart';

class MockAuthGateBloc extends MockBloc<AuthGateEvent, AuthGateState>
    implements AuthGateBloc {}

void main() {
  mainBloc();
}

void mainBloc() {
  final MockAuthenticationUseCase useCase = MockAuthenticationUseCase();

  group("AuthGateBloc", () {
    blocTest<AuthGateBloc, AuthGateState>(
      "Inital state is loading",
      build: () => AuthGateBloc(useCase),
      expect: () => const AuthGateState.loading(),
    );
  });
}
