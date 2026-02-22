import 'package:freezed_annotation/freezed_annotation.dart';
export 'result_extensions.dart';
export '../error/failure.dart';

part 'result.freezed.dart';

@freezed
class Result<S, F> with _$Result<S, F> {
  factory Result.success(S value) = Success<S, F>;
  factory Result.failure(F failure) = FailureResult<S, F>;
}






































// =======================================================================

// import 'package:mercado_v2/core/result/failure.dart';

// sealed class Result<T> {
//   const Result();

//   /* map: Para transformar el valor sin salir del contexto Result (ej: convertir un DTO a modelo). 
//   Mantiene la composición funcional.*/
//   Result<R> map<R>(R Function(T) f) {
//     return switch (this) {
//       Success(value: final v) => Success(f(v)),
//       Failure(exception: final e) => Failure<R>(e),
//     };
//   }

//   /* Desempaqueta y maneja ambos casos en una sola operación. Fuerza el manejo explícito de error y éxito.*/
//   U fold<U>(U Function(T) onSuccess, U Function(DomainException) onFailure) {
//     return switch (this) {
//       Success(value: final v) => onSuccess(v),
//       Failure(exception: final e) => onFailure(e),
//     };
//   }

//   /* Para tests */
//   T getOrThrow() {
//     return switch (this) {
//       Success(value: final v) => v,
//       Failure(exception: final e) => throw e,
//     };
//   }
// }

// class Success<T> extends Result<T> {
//   final T value;

//   const Success(this.value);
// }

// class Failure<T> extends Result<T> {
//   final DomainException exception;

//   const Failure(this.exception);
// }
