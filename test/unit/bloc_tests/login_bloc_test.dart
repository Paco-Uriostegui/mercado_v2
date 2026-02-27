import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/login/login_bloc.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/login/login_event.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/login/login_state.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mocks.mocks.dart';

void main() {
  provideDummy<Result<void, AuthFailure>>(Success(null));

  group("Login Bloc tests", () {
    late MockLoginUsecase mockLoginUsecase;
    late String validEmail;
    late String validPassword;

    setUp(() {
      mockLoginUsecase = MockLoginUsecase();
      validEmail = "valid@gmail.com";
      validPassword = "validPass123";
    });

    blocTest(
      "Test 1: Emits [Loading, Success] when usecase returns Result.success",
      setUp: () {
        when(
          mockLoginUsecase.call(
            email: anyNamed("email"),
            password: anyNamed("password"),
          ),
        ).thenAnswer((_) async => Result.success(null));
      },
      build: () => LoginBloc(mockLoginUsecase),
      act: (bloc) =>
          bloc.add(LoginSubmitted(validEmail,  validPassword)),
      expect: () => <LoginState>[LoginState.loading(), LoginState.success()],
      verify: (_) {
        verify(
          mockLoginUsecase.call(
            email: anyNamed("email"),
            password: anyNamed("password"),
          ),
        ).called(1);
      },
    );

    blocTest(
      "Test 2: Emits [Loading, Unknown] when usecase returns error",
      setUp: () {
        when(
          mockLoginUsecase.call(
            email: anyNamed("email"),
            password: anyNamed("password"),
          ),
        ).thenAnswer((_) async => Result.failure(UnknownAuthFailure()));
      },
      build: () => LoginBloc(usecase: mockLoginUsecase),
      act: (bloc) =>
          bloc.add(LoginSubmitted(email: validEmail, password: validPassword)),
      expect: () => <LoginState>[LoginState.loading(), LoginState.unknown()],
      verify: (_) {
        verify(
          mockLoginUsecase.call(
            email: anyNamed("email"),
            password: anyNamed("password"),
          ),
        ).called(1);
      },
    );
  });
}
