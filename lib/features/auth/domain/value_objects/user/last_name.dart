import 'package:equatable/equatable.dart';
import 'package:mercado_v2/app/core/result/failure.dart';

class LastName extends Equatable {
  final String value;

  const LastName._(this.value);

  factory LastName(String value) {
    final trimmedValue = value.trim();
    if (trimmedValue.length <= 1) {
      throw InvalidLastName.tooShort();
    }
    if (!RegExp(r'^[a-zA-Z\s\-]+$').hasMatch(trimmedValue)) {
      throw InvalidLastName.invalidCharacters();
    }

    return LastName._(trimmedValue);
  }

  @override
  List<Object?> get props => [value];
}
