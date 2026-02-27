import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/create_account/create_account_bloc.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/create_account/create_account_event.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/create_account/create_account_state.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mocks.mocks.dart';

void main() {
  group("CreateAccount Bloc tests", () {
    late MockCreateAccountUsecase mockCreateAccountUseCase;
    late String validEmail;
    late String validPassword;

    setUp(() {
      mockCreateAccountUseCase = MockCreateAccountUsecase();
      validEmail = "valid@gmail.com";
      validPassword = "validPass123";
    });
    blocTest(
      "Test 2: Emits [Success] when usecase retuns Result.Success",
      setUp: () {
        when(
          mockCreateAccountUseCase.call(
            emailString: anyNamed("emailString"),
            passwordString: anyNamed("passwordString"),
          ),
        ).thenAnswer((_) async => Result.success(null));
      },
      build: () => CreateAccountBloc(usecase: mockCreateAccountUseCase),

      act: (bloc) => bloc.add(
        CreateAccountSubmitted(email: validEmail, password: validPassword),
      ),

      expect: () => <CreateAccountState>[
        CreateAccountState.loading(),
        CreateAccountState.success(),
      ],

      verify: (_) {
        verify(
          mockCreateAccountUseCase.call(
            emailString: anyNamed("emailString"),
            passwordString: anyNamed("passwordString"),
          ),
        ).called(1);
      },
    );
    
    // .error tests with all posible failure states

    // Test 3: emits .unknown when usecase returns unknown()
    blocTest(
      "Test 3: Emits [.error] when usecase returns error",
      setUp: () {
        when(
          mockCreateAccountUseCase.call(
            emailString: anyNamed("emailString"),
            passwordString: anyNamed("passwordString"),
          ),
        ).thenAnswer((_) async => Result.failure(UnknownAuthFailure()));
      },
      build: () => CreateAccountBloc(usecase: mockCreateAccountUseCase),

      act: (bloc) => bloc.add(
        CreateAccountEvent.createAccountSubmitted(
          email: validEmail,
          password: validPassword,
        ),
      ),

      expect: () => <CreateAccountState>[
        CreateAccountState.loading(),
        CreateAccountState.unknown(),
      ],
      verify: (_) {
        verify(
          mockCreateAccountUseCase.call(
            emailString: anyNamed("emailString"),
            passwordString: anyNamed("passwordString"),
          ),
        ).called(1);
      },
    );

    //
  });
}
