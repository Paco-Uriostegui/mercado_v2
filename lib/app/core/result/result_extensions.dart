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

extension ResultXFlatMapAsync<S, F> on Result<S, F> {
  Future<Result<T, G>> newFlatMapAsync<T, G>(
    Future<Result<T, G>> Function(S value) onSuccess,
    G Function(F) mapFailure,
  ) async {
    return when(
      success: onSuccess, 
      failure: (f) => Future.value(Result.failure(mapFailure(f)))
      );
  }
}

/* 
<T, G> = nuevos tipos genéricos:

T = el nuevo tipo de Success que retornará
G = el nuevo tipo de Failure (convertido desde F)
onSuccess es una función que:
Recibe S (el success anterior)
Retorna Future<Result<T, G>> (una tarea asíncrona que da el nuevo resultado)
mapFailure es una función que:
Recibe F (el failure anterior, ej: EmailVOFailure)
Retorna G (el nuevo failure, ej: InvalidEmailFailure)

En el branch de success, ¿qué deberías hacer?

Tienes s (el success anterior, tipo S)
Tienes onSuccess (función que transforma S en Future<Result<T, G>>)
¿Qué es lo obvio aquí?
En el branch de failure, ¿qué deberías hacer?

Tienes f (el failure anterior, tipo F)
Tienes mapFailure (función que transforma F en G)
Necesitas retornar Future<Result<T, G>>
¿Cómo envuelves el failure convertido en un Result?
*/

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
