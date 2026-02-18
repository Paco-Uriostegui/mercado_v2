import 'package:flutter_test/flutter_test.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/authenticate_usecase.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/auth_gate/auth_gate_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mocks.mocks.dart';

void main() {
  group("AuthGate bloc tests", () {
    late AuthGateBloc bloc;
    late MockAuthenticationUseCase mockUseCase;
    setUp(() {
      mockUseCase = MockAuthenticationUseCase();
      bloc = AuthGateBloc(mockUseCase);

      // ----------------------------------- stubs
      when(mockUseCase.call()).thenAnswer((_) => Stream<AuthUserStatus>.value(AuthUserComplete()));
    });
    //
  });
}