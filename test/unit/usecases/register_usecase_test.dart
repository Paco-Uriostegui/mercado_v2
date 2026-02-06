




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
- se llama a authRepo.sendVerificationEmail()
      -> si hay error, se pasa por alto ya que el usuario podrá relanzar manualmente en verifyEmailScreen
      -> si hay error:
          - 
      -> si no hay error: 
          - 
          - return Result.success(BackendUserCreatedIncomplete()
      // si el usuario cierra la app en este momento, siempre podrá actualizar su nombre en la profileScreen 
      // ya que el nombre no se subirá a firestore(por ahora)
      // lo que se puede hacer al ir a homeScreen es leer el firebaseUser, si el name es null, se mostrará un snackbar
      // para invitarlo a agregar su nombre en la profileScreen

- devuelve Result.success(BackendUserCreatedSuccesfully())
  "Fin de usecase"
- (bloc hace when de la respuesta y emite state para que la UI reaccione)
*/ 
// test('Test 2: ')


