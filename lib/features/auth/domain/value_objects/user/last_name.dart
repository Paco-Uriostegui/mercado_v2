import 'package:equatable/equatable.dart';
import 'package:mercado_v2/app/core/result/failure.dart';
import 'package:mercado_v2/app/core/result/result.dart';

class LastName extends Equatable {
  final String value;

  const LastName._(this.value);

  factory LastName(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.length <= 1) {
      throw InvalidLastNameTooShort();
    }
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(trimmedValue)) {
      throw InvalidLastNameInvalidChars();
    }

    return LastName._(trimmedValue);
  }

  static Result<LastName> create(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.length <= 1) {
      return Result.failure(InvalidLastNameTooShort());
    }
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(trimmedValue)) {
      return Result.failure(InvalidLastNameInvalidChars());
    }
    return Result.success(LastName._(trimmedValue));
  }

  @override
  List<Object?> get props => [value];
}
