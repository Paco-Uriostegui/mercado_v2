import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mercado_v2/app/core/result/failure.dart';
export 'result_extensions.dart';
export 'failure.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  factory Result.success(T value) = Success<T>;
  factory Result.failure(Failure failure) = FailureResult<T>;
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
