// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mercado_v2/features/home_app_shell/presentation/screens/home_app_shell_prov.dart';

// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthBloc, AuthState>(
//       builder: (context, state) {
//         return state.when(
//           authenticated: () => HomeAppShellProvisional(),
//           notAuthenticated: () => LoginScreen(),
//           loading: () => SplashScreen(),
//           authenticatedUnverified: () => VerifyEmailScreen(),
          
//         );
//       },
//     );
//   }
// }
