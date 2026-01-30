import 'package:mercado_v2/core/result/failure.dart';

class Password {
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
}
