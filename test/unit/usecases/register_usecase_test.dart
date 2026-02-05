


/* 
- (el usuario ingresa datos en campos)
- (el usuario presiona el botón "crear cuenta")
- se lanza RegisterUseCase
- se validan value objects correo y contraseña
- se llama a createAccount...() de firebase (repo)
- si no arroja error, se llama a sendVerificationEmail...()
- devuelve un AuthUser con el uid y isEmailVerified: false
- (bloc hace when de la respuesta y emite state que ordena la navegación)
*/ 
test('Test 2: ')