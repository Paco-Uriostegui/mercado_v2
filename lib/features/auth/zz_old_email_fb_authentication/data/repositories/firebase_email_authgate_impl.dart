// import 'dart:async';

// import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/iauth_gate.dart';
// import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/iauth_repository.dart';
// import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/screens/login_screen.dart';
// import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/screens/verify_email_screen.dart';

// class FirebaseEmailAuthgateImpl implements NewIAuthGate {
//   final IAuthRepository _authRepository;
//   late StreamController<AuthenticationStatus> _controlador;

//   FirebaseEmailAuthgateImpl({required IAuthRepository authRepository})
//     : _authRepository = authRepository {
//     _controlador = StreamController<AuthenticationStatus>();
//     firebaseAuthStream();
//   }

//   @override
//   Stream<AuthenticationStatus> get authenticationGateStream =>
//       _controlador.stream;

//   Future<void> firebaseAuthStream() async {
//     _authRepository.onStateChanges().listen((authUser) {
//       if (authUser != null) {
//         if (authUser.isEmailVerified) {
//           _controlador.sink.add(AuthenticationSuccess());
//         } else {
//           VerifyEmailScreen();
//         }
//       } else {
//         LoginScreen();
//       }
//     });
//   }
// }
