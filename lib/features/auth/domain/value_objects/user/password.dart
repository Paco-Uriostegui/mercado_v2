import 'package:equatable/equatable.dart';
import 'package:mercado_v2/app/core/result/failure.dart';
import 'package:mercado_v2/app/core/result/result.dart';

class Password extends Equatable{
  final String value;

  const Password._(this.value);

  static Result<Password> create(String value) {
    final p = value.trim();
    if (p.length >= 8) {
      return Result.success(Password._(value));
    } else {
      return Result.failure(InvalidPasswordFormat());
    }
  }

  // factory Password(String value) {
  //   final p = value.trim();
  //   if (p.length >= 8) {
  //     return Password._(value);
  //   } else {
  //     throw InvalidPasswordFormat();
  //   }
  // }
  
  @override
  List<Object?> get props => [value];
}
