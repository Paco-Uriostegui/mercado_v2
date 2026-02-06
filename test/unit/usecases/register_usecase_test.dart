




/*  ¿qué debe hacer el register use case?
✓ debe validar email y password y devolver error si falla
✓ debe crear la cuenta llamando a createAccount...() de firebase y devolver error si falla
✓ debe llamar a verifyEmail...() si falla no pasa nada, se vuelve a reenviar con el botón reenviar que está en la verifyEmailScreen
✓ debe llamar a updateEmail...() sólo después de que se creó con éxito el authUser, si falla devuelve un error especial que lanza un estado de exito pero sin nombre
que luego mostrará un snackbar para decirle al usuario que no se pudo guardar su nombre, que vaya al perfil a guardarlo.




  FLUJO CREATE ACCOUNT SCREEN
- (el usuario ingresa datos en campos)
- (el usuario presiona el botón "crear cuenta")
- (UI lanza evento a bloc)
- bloc lanza RegisterUseCase
 "Inicio de usecase"
- se validan localmente value objects correo, contraseña, firstName, lastName, secondLastName
      -> si hay error, return Result.failure(EmailInvalidException o PasswordInvalidException, etc)
- se llama a authRepository.createAccount...() de firebase (repo)
      -> si hay error, return Result.failure(AuthException)
- se llama a authRepository.updateDisplayName(nombreCompleto)
        -> si hay error:
            - se llama a authRepo.sendVerificationEmail()
                -> si hay error, se pasa por alto ya que el usuario podrá relanzar manualmente en verifyEmailScreen  
            - return Result.success(RegistrationSuccessWithIncompleteProfile()
        -> si no hay error: 
            - se llama a authRepo.sendVerificationEmail()
                -> si hay error, se pasa por alto ya que el usuario podrá relanzar manualmente en verifyEmailScreen
            - devuelve Result.success(RegistrationSuccess())
  "Fin de usecase"
- (bloc hace when de la respuesta y emite state para que la UI reaccione)

======================================
"Inicio de register use case"
- nombreCompleto = Validación de VO's (email, password, name, lastName, secondLastName) (crear un método privado que abra todos los results)
        -> failure? return Result.failure(EmailInvalidException o PasswordInvalidException, etc)
- authRepo.createAccount...() 
        -> failure? return Result.failure(AuthException)
- responseResult = authRepo.updateDisplayName(nombreCompleto)
- authRepo.sendVerificationEmail()
        -> retorna void, cualquier error ya habrá sido atrapado previamente, ya que el usuario podrá relanzar manualmente en verifyEmailScreen  
- if (responseResult)
        -> success: return Result.success(RegistrationSuccess())
        -> failure: return Result.success(RegistrationSuccessWithIncompleteProfile()
"Fin de register use case"




*/ 
// test('Test 2: ')


