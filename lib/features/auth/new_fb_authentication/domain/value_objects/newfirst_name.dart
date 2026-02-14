import 'package:equatable/equatable.dart';
import 'package:mercado_v2/app/core/result/failure.dart';
import 'package:mercado_v2/app/core/result/result.dart';

class NewFirstName extends Equatable {
  final String value;

  const NewFirstName._(this.value);

  factory NewFirstName(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.length <= 1) {
      throw InvalidFirstNameTooShort();
    }
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(trimmedValue)) {
      throw InvalidFirstNameInvalidChars();
    }
    return NewFirstName._(trimmedValue);
  }

  static Result<NewFirstName> create(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.length <= 1) {
      return Result.failure(InvalidFirstNameTooShort());
    }
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(trimmedValue)) {
      return Result.failure(InvalidFirstNameInvalidChars());
    }
    return Result.success(NewFirstName._(trimmedValue));
  }


  @override
  List<Object?> get props => [value];
}
