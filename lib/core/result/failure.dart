sealed class Failure {
  const Failure();
}

class NetworkException extends Failure {
  const NetworkException();
}

class InvalidCredentials extends Failure {
  const InvalidCredentials();
}

class LocalException extends Failure {
  const LocalException();
}

class AuthException extends Failure {
  final String errorMessage;
  const AuthException(this.errorMessage);
}

class InvalidEmail extends Failure {
  const InvalidEmail();
}

class InvalidPassword extends Failure {
  const InvalidPassword();
}

class InvalidFirstName extends Failure {
  final String errorMessage;

  const InvalidFirstName(this.errorMessage);
  factory InvalidFirstName.tooShort() {
    return InvalidFirstName('El nombre no puede contener sólo una letra');
  }

  factory InvalidFirstName.invalidCharacters() {
    return InvalidFirstName('El nombre o nombres sólo pueden contener letras o guiones si es un nombre compuesto.');
  }
}

class InvalidLastName extends Failure {
  final String errorMessage;

  const InvalidLastName(this.errorMessage);
  factory InvalidLastName.tooShort() {
    return InvalidLastName('El apellido no puede contener sólo una letra');
  }

  factory InvalidLastName.invalidCharacters() {
    return InvalidLastName('El apellido sólo puede contener letras o guiones si es un apellido compuesto.');
  }
}

class InvalidSecondLastName extends Failure {
  final String errorMessage;

  const InvalidSecondLastName(this.errorMessage);
  factory InvalidSecondLastName.tooShort() {
    return InvalidSecondLastName('El segundo apellido no puede contener sólo una letra');
  }

  factory InvalidSecondLastName.invalidCharacters() {
    return InvalidSecondLastName('El segundo apellido sólo puede contener letras o guiones si es un apellido compuesto.');
  }
}

class UnknownException extends Failure {
  const UnknownException();
}
