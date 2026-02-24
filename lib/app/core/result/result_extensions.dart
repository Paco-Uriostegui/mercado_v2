import 'result.dart';

extension ResultX<S, F> on Result<S, F> {
  Result<R, F> flatMap<R>(Result<R, F> Function(S value) f) {
    return when(
      success: (value) => f(value),
      failure: (failure) => Result.failure(failure),
    );
  }
}

extension ResultAsyncX<S, F> on Result<S, F> {
  Future<Result<R, F>> flatMapAsync<R>(
    Future<Result<R, F>> Function(S value) f,
  ) async {
    return when(
      success: (value) => f(value),
      failure: (e) async => Result.failure(e),
    );
  }
}

extension ResultXFailure<S, F> on Result<S, F> {
  Result<S, T> mapFailure<T>(T Function(F failure) f) {
    return when(
      success: (value) => Result<S, T>.success(value),
      failure: (e) => Result<S, T>.failure(f(e)),
    );
  }
}

extension ResultIsFailure<S, F> on Result<S, F> {
  bool get isFailure {
    return when(success: (_) => false, failure: (_) => true);
  }
}

extension ResultGetSuccessValue<S, F> on Result<S, F> {
  S? get getSuccess {
    return when(success: (value) => value, failure: (_) => null);
  }
}

// extension ResultChaining<S, F> on Result<S, F> {
//   Future<Result<T, F>> flatMapAsync<T>(
//     Future<Result<T, F>> Function(S) onSuccess,
//   ) async {
//     return when(
//       success: onSuccess,
//       failure: (f) => Result.failure(f),
//     );
//   }
// }
// return Email.create(email)
//   .mapFailure((_) => InvalidEmailFailure())
//   .flatMapAsync((emailVO) => Password.create(password)
//     .mapFailure((_) => InvalidPasswordFormatLoginFailure())
//     .flatMapAsync((passVO) => _authRepository.trySignInWithEmailAndPassword(emailVO, passVO))
//   );
