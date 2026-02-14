import 'package:equatable/equatable.dart';
import 'package:mercado_v2/app/core/result/failure.dart';
import 'package:mercado_v2/app/core/result/result.dart';

class NewEmail extends Equatable {
  final String value;


  static Result<NewEmail> create(String value) {
    final e = value.trim();
    if (_isValid(e)) {
      return Result.success(NewEmail._(value));
    }
    return Result.failure(InvalidEmailFormat());
  }

  factory NewEmail.direct(String value) {
    final result = NewEmail.create(value);
    return result.map(success: (success) => success.value, failure: (failure) => throw InvalidEmailFormat());
  }


  const NewEmail._(this.value);

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