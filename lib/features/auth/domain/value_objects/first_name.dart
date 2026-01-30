import 'package:equatable/equatable.dart';
import 'package:mercado_v2/core/result/failure.dart';

class FirstName extends Equatable {
  final String value;

  const FirstName._(this.value);

  factory FirstName(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.length <= 1) {
      throw InvalidFirstName.tooShort();
    }
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(trimmedValue)) {
      throw InvalidFirstName.invalidCharacters();
    }
    return FirstName._(trimmedValue);
  }

  @override
  List<Object?> get props => [value];
}
