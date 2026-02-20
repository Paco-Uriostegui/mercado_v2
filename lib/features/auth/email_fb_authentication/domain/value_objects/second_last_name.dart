import 'package:equatable/equatable.dart';
import 'package:mercado_v2/app/core/result/result.dart';
export 'second_last_name.dart';

class SecondLastName extends Equatable {
  final String value;

  const SecondLastName._(this.value);

  factory SecondLastName(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.length <= 1) {
      throw SecondLastNameTooShortFailure();
    }
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(trimmedValue)) {
      throw SecondLastNameInvalidCharsFailure();
    }
    return SecondLastName._(trimmedValue);
  }

  static Result<SecondLastName, ValueObjectsFailure> create(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.length <= 1) {
      return Result.failure(SecondLastNameTooShortFailure());
    }
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(trimmedValue)) {
      return Result.failure(SecondLastNameInvalidCharsFailure());
    }
    return Result.success(SecondLastName._(trimmedValue));
  }

  @override
  List<Object?> get props => [value];
}