import 'package:flutter_test/flutter_test.dart';
import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/create_account_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mocks.mocks.dart';

void main() {
  group('create account use case', () {
    late CreateAccountUsecase usecase;
    late MockIAuthRepository mockIAuthRepository;
    late String validEmailString;
    late String validPassString;
    // late String validName;
    // late String validLastName;
    // late String validSecondLastName;

    setUp(() {
      validEmailString = 'email@gmail.com';
      validPassString = 'abcdefghijk';
      // validName = 'Name';
      // validLastName = 'validLastName';
      // validSecondLastName = 'validSecondLastName';

      mockIAuthRepository = MockIAuthRepository();
      usecase = CreateAccountUsecase(authRepository: mockIAuthRepository);

      // --------------------------------------------------------------- stubs
      when(
        mockIAuthRepository.tryCreateUserWithEmailAndPassword(any, any),
      ).thenAnswer((_) async => Result.success(null));
      //when(_mockIAuthRepository.trySendEmailVerification());
      //   when(
      //     mockIAuthRepository.tryUpdateDisplayName(any, any, any),
      //   ).thenAnswer((_) async => Result.success(null));
    });

    test('Test 2: New user account is created succesfully', () async {
      // Arrange

      // Act
      final result = await usecase(
        emailString: validEmailString,
        passwordString: validPassString,
        // firstNameString: validName,
        // lastNameString: validLastName,
        // secondLastNameString: validSecondLastName,
      );
      //final success = result as Success<void>;

      // Assert
      if (result case Success()) {
        //verify(mockIAuthRepository.tryUpdateDisplayName(any, any, any)).called(1);
        verify(mockIAuthRepository.trySendVerificationEmail()).called(1);
        verify(
          mockIAuthRepository.tryCreateUserWithEmailAndPassword(any, any),
        ).called(1);
      }
    });

    test('Test 3: Returns failure when email is invalid', () async {
      // Arrange

      // Act
      final result = await usecase(
        emailString: 'invalid-email',
        passwordString: validPassString,
        // firstNameString: validName,
        // lastNameString: validLastName,
        // secondLastNameString: validSecondLastName,
      );

      // Assert
      if (result case FailureResult(:final failure)) {
        expect(failure, isA<InvalidEmailVOFormatFailure>());
        verifyNever(
          mockIAuthRepository.tryCreateUserWithEmailAndPassword(any, any),
        );
        //verifyNever(mockIAuthRepository.tryUpdateDisplayName(any, any, any));
        verifyNever(mockIAuthRepository.trySendVerificationEmail());
      } else {
        fail('InvalidEmailFormat was expected');
      }
    });

    test('Test 4: Returns failure when password is too short', () async {
      // Arrange

      // Act
      final result = await usecase(
        emailString: validEmailString,
        passwordString: 'short',
        // firstNameString: validName,
        // lastNameString: validLastName,
        // secondLastNameString: validSecondLastName,
      );

      // Assert
      if (result case FailureResult(:final failure)) {
        expect(failure, isA<WeakPasswordVOFailure>());
        verifyNever(
          mockIAuthRepository.tryCreateUserWithEmailAndPassword(any, any),
        );
        //verifyNever(mockIAuthRepository.tryUpdateDisplayName(any, any, any));
        verifyNever(mockIAuthRepository.trySendVerificationEmail());
      } else {
        fail('PasswordTooShort was expected');
      }
    });

    // test(
    //   'Test 5: Returns failure when first name has invalid characters',
    //   () async {
    //     // Arrange

    //     // Act
    //     final result = await usecase(
    //       emailString: validEmail,
    //       passwordString: validPass,
    //       firstNameString: 'Invalid@Name',
    //       lastNameString: validLastName,
    //       secondLastNameString: validSecondLastName,
    //     );

    //     // Assert
    //     if (result case FailureResult(:final failure)) {
    //       expect(failure, isA<InvalidFirstNameInvalidChars>());
    //       verifyNever(
    //         mockIAuthRepository.tryCreateUserWithEmailAndPassword(any, any),
    //       );
    //       verifyNever(mockIAuthRepository.tryUpdateDisplayName(any, any, any));
    //       verifyNever(mockIAuthRepository.trySendEmailVerification());
    //     } else {
    //       fail('InvalidFirstNameInvalidChars was expected');
    //     }
    //   },
    // );

    // test('Test 6: returns failure when last name is too short', () async {
    //   // Arrange

    //   // Act
    //   final result = await usecase(
    //     emailString: validEmail,
    //     passwordString: validPass,
    //     firstNameString: validName,
    //     lastNameString: 'L',
    //     secondLastNameString: validSecondLastName,
    //   );

    //   // Assert
    //   if (result case FailureResult(:final failure)) {
    //     expect(failure, isA<InvalidLastNameTooShort>());
    //     verifyNever(
    //       mockIAuthRepository.tryCreateUserWithEmailAndPassword(any, any),
    //     );
    //     verifyNever(mockIAuthRepository.tryUpdateDisplayName(any, any, any));
    //     verifyNever(mockIAuthRepository.trySendEmailVerification());
    //   } else {
    //     fail('InvalidLastNameTooShort was expected');
    //   }
    // });
    // test(
    //   'Test 7: returns failure when second last name has invalid characters',
    //   () async {
    //     // Arrange

    //     // Act
    //     final result = await usecase(
    //       emailString: validEmail,
    //       passwordString: validPass,
    //       firstNameString: validName,
    //       lastNameString: validLastName,
    //       secondLastNameString: 'Invalid@SecondLastName',
    //     );

    //     // Assert
    //     if (result case FailureResult(:final failure)) {
    //       expect(failure, isA<InvalidSecondLastNameInvalidChars>());
    //       verifyNever(
    //         mockIAuthRepository.tryCreateUserWithEmailAndPassword(any, any),
    //       );
    //       verifyNever(mockIAuthRepository.tryUpdateDisplayName(any, any, any));
    //       verifyNever(mockIAuthRepository.trySendEmailVerification());
    //     } else {
    //       fail('InvalidSecondLastNameInvalidChars was expected');
    //     }
    //   },
    // );

    test('Test 8: Account creation method fails', () async {
      // Arrange
      when(
        mockIAuthRepository.tryCreateUserWithEmailAndPassword(any, any),
      ).thenAnswer((_) async => Result.failure(AuthFailure()));

      // Act
      final result = await usecase(
        emailString: validEmailString,
        passwordString: validPassString,
        // firstNameString: validName,
        // lastNameString: validLastName,
        // secondLastNameString: validSecondLastName,
      );
      if (result case FailureResult(:final failure)) {
        expect(failure, isA<AuthFailure>());
        verifyNever(mockIAuthRepository.trySendVerificationEmail());
        //verifyNever(mockIAuthRepository.tryUpdateDisplayName(any, any, any));
      } else {
        fail('AuthException was expected');
      }
    });

    //     test('Test 9: Account is created with incomplete profile', () async {
    //       // Arrange
    //       when(
    //         mockIAuthRepository.tryUpdateDisplayName(any, any, any),
    //       ).thenAnswer((_) async => Result.failure(AuthException()));

    //       // Act
    //       final result = await usecase(
    //         emailString: validEmail,
    //         passwordString: validPass,
    //         // firstNameString: validName,
    //         // lastNameString: validLastName,
    //         // secondLastNameString: validSecondLastName,
    //       );
    //       if (result case Success(:final value)) {
    //         expect(value, isA<RegistrationSuccessWithIncompleteProfile>());
    //         verify(mockIAuthRepository.tryCreateUserWithEmailAndPassword(any, any))
    //             .called(1);
    //         verify(mockIAuthRepository.tryUpdateDisplayName(any, any, any)).called(1);
    //         verify(mockIAuthRepository.trySendEmailVerification()).called(1);
    //       } else {
    //         fail('RegistrationSuccessWithIncompleteProfile was expected');
    //       }
    //     });
    //     //
  });
}

    // Test 2: New user account is created succesfully
    // when:
    //    - authRepo.createAccount...() => Result.success()
    //    - authRepo.updateDispl...() => Result.success()
    //    - authRepo.sendVerif...() => Result.success()
    // verify:
    //    - authRepo.createAccount...() called 1
    //    - authRepo.updateDispl...() => called 1
    //    - authRepo.sendVerif...() => called 1
    //    state: RegistrationSuccess