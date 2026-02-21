import 'package:equatable/equatable.dart';
import 'package:mercado_v2/app/core/data/failure.dart';
import 'package:mercado_v2/app/core/result/result.dart';

class FirstName extends Equatable {
  final String value;

  const FirstName._(this.value);

  factory FirstName(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.length <= 1) {
      throw FirstNameTooShortFailure();
    }
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(trimmedValue)) {
      throw FirstNameInvalidCharsFailure();
    }
    return FirstName._(trimmedValue);
  }

  static Result<FirstName, ValueObjectsFailure> create(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.length <= 1) {
      return Result.failure(FirstNameTooShortFailure());
    }
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(trimmedValue)) {
      return Result.failure(FirstNameInvalidCharsFailure());
    }
    return Result.success(FirstName._(trimmedValue));
  }


  @override
  List<Object?> get props => [value];
}
