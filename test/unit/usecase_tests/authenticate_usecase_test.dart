import 'package:flutter_test/flutter_test.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/data/models/auth_user_model.dart';
//import 'package:mercado_v2/app/core/result/result.dart';
//import 'package:mercado_v2/features/auth/email_fb_authentication/domain/entities/auth_user/auth_user.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/authenticate_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mocks.mocks.dart';

void main() {
  //provideDummy<Result<void, AuthFailure>>(Success(null));

  group("Authenticate usecase tests", () {
    late AuthenticationUseCase usecase;
    late MockIAuthRepository mockIAuthRepository;
    setUp(() {
      mockIAuthRepository = MockIAuthRepository();
      usecase = AuthenticationUseCase(authRepository: mockIAuthRepository);
      AuthUserModel fakeUser = AuthUserModel(
        uid: "1234",
        name: "fakeUser",
        isEmailVerified: true,
      );
      //Stream<AuthUserModel?> fakeStream = fakeUser;

      // ----------------------------------------------------- stubs
      when(
        mockIAuthRepository.onStateChanges(),
      ).thenAnswer((_) => Stream<AuthUserModel?>.value(fakeUser));
    });
    test("Test 2: Stream returns valid user", () async {
      // Arrange

      // Act
      final result = usecase.execute();

      // Assert
      expect(result, isA<Stream<AuthUserStatus>>());
      verify(mockIAuthRepository.onStateChanges()).called(1);
      expect(await result.first, isA<AuthUserComplete>());
    });

    test("Test 3: Stream returns a non verified user", () async {
      // Arrange
      AuthUserModel fakeUser = AuthUserModel(
        uid: "1234",
        name: "fakeUser",
        isEmailVerified: false,
      );
      when(
        mockIAuthRepository.onStateChanges(),
      ).thenAnswer((_) => Stream<AuthUserModel?>.value(fakeUser));

      // Act
      final result = usecase.execute();

      // Assert
      expect(result, isA<Stream<AuthUserStatus>>());
      verify(mockIAuthRepository.onStateChanges()).called(1);
      expect(await result.first, isA<AuthUserNotVerified>());
    });

    test("Test 4: Stream returns null user", () async {
      // Arrange
      when(
        mockIAuthRepository.onStateChanges(),
      ).thenAnswer((_) => Stream<AuthUserModel?>.value(null));

      // Act
      final result = usecase.execute();

      // Assert
      expect(result, isA<Stream<AuthUserStatus>>());
      verify(mockIAuthRepository.onStateChanges()).called(1);
      expect(await result.first, isA<AuthUserNotAuthenticated>());
    });

    //
  });
}
