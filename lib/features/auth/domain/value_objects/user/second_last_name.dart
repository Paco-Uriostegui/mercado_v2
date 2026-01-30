import 'package:equatable/equatable.dart';
import 'package:mercado_v2/core/result/failure.dart';

class SecondLastName extends Equatable {
  final String value;

  const SecondLastName._(this.value);

  factory SecondLastName(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.length <= 1) {
      throw InvalidSecondLastName.tooShort();
    }
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(trimmedValue)) {
      throw InvalidSecondLastName.invalidCharacters();
    }
    return SecondLastName._(trimmedValue);
  }

  @override
  List<Object?> get props => [value];
}
