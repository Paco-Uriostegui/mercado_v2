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

class InvalidEmailFormat extends Failure {
  final String errorMessage = 'El formato del correo es inválido. Por favor verifícalo.';
  
}

class InvalidPasswordFormat extends Failure {
  final String errorMessage = 'La contraseña debe contener al menos 8 caracteres';
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

class LocalUserException extends Failure {
  final String errorMessage;
  const LocalUserException(this.errorMessage);
  
  factory LocalUserException.errorWhileSavingUser() {
    return LocalUserException('Error while saving user locally');
  }

  factory LocalUserException.errorGettingUser() {
    return LocalUserException('Error getting user locally');
  }
  factory LocalUserException.errorRemovingUser() {
    return LocalUserException('Error removing user locally');
  }

  // ----------------------------------------------------------------
  


 
} 
class RemoteAuthException extends Failure {
  const RemoteAuthException();
}

class GetCurrentUserException extends RemoteAuthException {
  const GetCurrentUserException();
}