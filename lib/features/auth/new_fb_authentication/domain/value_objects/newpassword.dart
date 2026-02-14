import 'package:equatable/equatable.dart';
import 'package:mercado_v2/app/core/result/failure.dart';
import 'package:mercado_v2/app/core/result/result.dart';

class NewPassword extends Equatable{
  final String value;

  const NewPassword._(this.value);

  static Result<NewPassword> create(String value) {
    final p = value.trim();
    if (p.length >= 8) {
      return Result.success(NewPassword._(value));
    } else {
      return Result.failure(InvalidPasswordTooShort());
    }
  }

  // factory Password(String value) {
  //   final p = value.trim();
  //   if (p.length >= 8) {
  //     return Password._(value);
  //   } else {
  //     throw InvalidPasswordTooShort();
  //   }
  // }
  
  @override
  List<Object?> get props => [value];
}