import 'package:equatable/equatable.dart';
import 'package:mercado_v2/core/result/failure.dart';

class Password extends Equatable{
  final String value;

  const Password._(this.value);

  factory Password(String value) {
    final p = value.trim();
    if (p.length >= 8) {
      return Password._(value);
    } else {
      throw InvalidPassword();
    }
  }
  
  @override
  List<Object?> get props => [value];
}
