import 'package:equatable/equatable.dart';
import 'package:mercado_v2/core/result/failure.dart';
import 'package:mercado_v2/core/result/result.dart';

class Email extends Equatable {
  final String value;


  static Result<Email> create(String value) {
    final e = value.trim();
    if (_isValid(e)) {
      return Result.success(Email._(value));
    }
    return Result.failure(InvalidEmailFormat());
  }


  const Email._(this.value);

  // factory Email(String value) {
  //   final e = value.trim();
  //   if (!_isValid(e)) {
  //     throw InvalidEmailFormat();
  //   }
  //   return Email._(e);
  // }

  static bool _isValid(String e) {
    return e.isNotEmpty &&
        e.length > 3 &&
        e.contains('@') &&
        e.contains('.') &&
        e.indexOf('@') > 0 &&
        e.indexOf('@') < e.length - 1;
  }
  
  @override

  List<Object?> get props => [value];
}
