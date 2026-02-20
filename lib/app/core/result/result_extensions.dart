
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
