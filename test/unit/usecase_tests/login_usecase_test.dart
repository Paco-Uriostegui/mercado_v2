import 'package:flutter_test/flutter_test.dart';
import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/login_usecase.dart';
//import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/create_account/create_account_state.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mocks.mocks.dart';

void main() {
  provideDummy<Result<void, AuthFailure>>(Success(null));

  group('LoginUseCase unit tests', () {
    late LoginUsecase usecase;
    late MockIAuthRepository mockIAuthRepository;
    late String validEmailString;
    late String validPasswordString;
    setUp(() {
      mockIAuthRepository = MockIAuthRepository();
      usecase = LoginUsecase(authRepository: mockIAuthRepository);
      validPasswordString = 'validpassword123';
      validEmailString = 'valid@email.com';

      // ------------------------------------------------------ mocks
      when(
        mockIAuthRepository.trySignInWithEmailAndPassword(any, any),
      ).thenAnswer((_) async => Result.success(null));
    });
    test('Test 2: Successful sign in', () async {
      // Arrange
      // Act
      final result = await usecase(
        email: validEmailString,
        password: validPasswordString,
      );

      // Assert
      switch (result) {
        case Success():
          verify(
            mockIAuthRepository.trySignInWithEmailAndPassword(any, any),
          ).called(1);
        case FailureResult():
          fail('Success was expected, but got failure');
      }

      // if (result case Success()) {
      //   verify(
      //     mockIAuthRepository.trySignInWithEmailAndPassword(any, any),
      //   ).called(1);
      // } else {
      //   fail('Success was expected');
      // }
    });

    test('Test 3: Invalid email', () async {
      // Arrange
      final String invalidPasswordString = 'notAt';
      // Act
      final result = await usecase(
        email: invalidPasswordString,
        password: validPasswordString,
      );

      // Assert
      switch (result) {
        case FailureResult(:final failure):
          expect(failure, isA<InvalidEmailFormatFailure>());
          verifyNever(
            mockIAuthRepository.trySignInWithEmailAndPassword(any, any),
          );
        case Success():
          fail('InvalidEmailFormat was expected, but got success');
      }
      // if (result case FailureResult(:final failure)) {
      //   expect(failure, isA<InvalidEmailVOFormatFailure>());
      //   verifyNever(
      //     mockIAuthRepository.trySignInWithEmailAndPassword(any, any),
      //   );
      // } else {
      //   fail('InvalidEmailFormat was expected');
      // }
    });

    test('Returns failure when password is too short', () async {
      // Arrange
      final String invalidPasswordString = 'short';
      // Act
      final result = await usecase(
        email: validEmailString,
        password: invalidPasswordString,
      );

      // Assert
      switch (result) {
        case FailureResult(:final failure):
          expect(failure, isA<InvalidPasswordFormatFailure>());
          verifyNever(
            mockIAuthRepository.trySignInWithEmailAndPassword(any, any),
          );
        case Success():
          fail('InvalidPasswordFormat was expected, but got success');
      }

      // if (result case FailureResult(:final failure)) {
      //   expect(failure, isA<WeakPasswordFailure>());
      //   verifyNever(
      //     mockIAuthRepository.trySignInWithEmailAndPassword(any, any),
      //   );
      // } else {
      //   fail('InvalidPasswordTooShort was expected');
      // }
    });

    test('Returns failure when login method fails', () async {
      // Arrange
      when(
        mockIAuthRepository.trySignInWithEmailAndPassword(any, any),
      ).thenAnswer((_) async => Result.failure(UnknownAuthFailure()));

      // Act
      final result = await usecase(
        email: validEmailString,
        password: validPasswordString,
      );

      // Assert
      switch (result) {
        case FailureResult(:final failure):
          expect(failure, isA<UnknownAuthFailure>());
        case Success():
          fail('UnknownAuthFailure was expected, but got success');
      }




      // if (result case FailureResult(:final failure)) {
      //   expect(failure, isA<UnknownAuthFailure>());
      // } else {
      //   fail('UnknownFailure was expected');
      // }
    });

    // --
  });
}
