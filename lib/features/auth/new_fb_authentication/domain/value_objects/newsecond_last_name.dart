import 'package:equatable/equatable.dart';
import 'package:mercado_v2/app/core/result/failure.dart';
import 'package:mercado_v2/app/core/result/result.dart';
export '';

class NewSecondLastName extends Equatable {
  final String value;

  const NewSecondLastName._(this.value);

  factory NewSecondLastName(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.length <= 1) {
      throw InvalidSecondLastNameTooShort();
    }
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(trimmedValue)) {
      throw InvalidSecondLastNameInvalidChars();
    }
    return NewSecondLastName._(trimmedValue);
  }

  static Result<NewSecondLastName> create(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.length <= 1) {
      return Result.failure(InvalidSecondLastNameTooShort());
    }
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(trimmedValue)) {
      return Result.failure(InvalidSecondLastNameInvalidChars());
    }
    return Result.success(NewSecondLastName._(trimmedValue));
  }

  @override
  List<Object?> get props => [value];
}