import 'package:equatable/equatable.dart';
import 'package:mercado_v2/app/core/result/result.dart';
export 'second_last_name.dart';

class SecondLastName extends Equatable {
  final String value;

  const SecondLastName._(this.value);

  factory SecondLastName(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.length <= 1) {
      throw InvalidSecondLastNameTooShort();
    }
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(trimmedValue)) {
      throw InvalidSecondLastNameInvalidChars();
    }
    return SecondLastName._(trimmedValue);
  }

  static Result<SecondLastName> create(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.length <= 1) {
      return Result.failure(InvalidSecondLastNameTooShort());
    }
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(trimmedValue)) {
      return Result.failure(InvalidSecondLastNameInvalidChars());
    }
    return Result.success(SecondLastName._(trimmedValue));
  }

  @override
  List<Object?> get props => [value];
}