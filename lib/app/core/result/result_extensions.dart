
import 'result.dart';

extension ResultX<T> on Result<T> {
  Result<R> flatMap<R>(Result<R> Function(T) f) {
    return when(
      success: f,
      failure: (e) => Result.failure(e),
    );
  }
}

extension ResultAsyncX<T> on Result<T> {
  Future<Result<R>> flatMapAsync<R>(
    Future<Result<R>> Function(T) f,
  ) async {
    return when(
      success: (value) => f(value),
      failure: (e) async => Result.failure(e),
    );
  }
}
