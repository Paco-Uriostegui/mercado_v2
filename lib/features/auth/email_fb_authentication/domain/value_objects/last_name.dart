import 'package:equatable/equatable.dart';
import 'package:mercado_v2/app/core/data/failure.dart';
import 'package:mercado_v2/app/core/result/result.dart';

class LastName extends Equatable {
  final String value;

  const LastName._(this.value);

  factory LastName(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.length <= 1) {
      throw LastNameTooShortFailure();
    }
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(trimmedValue)) {
      throw LastNameInvalidCharsFailure();
    }

    return LastName._(trimmedValue);
  }

  static Result<LastName, ValueObjectsFailure> create(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.length <= 1) {
      return Result.failure(LastNameTooShortFailure());
    }
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(trimmedValue)) {
      return Result.failure(LastNameInvalidCharsFailure());
    }
    return Result.success(LastName._(trimmedValue));
  }

  @override
  List<Object?> get props => [value];
}
