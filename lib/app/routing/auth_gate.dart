import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercado_v2/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:mercado_v2/features/auth/presentation/bloc/auth/auth_state.dart';
import 'package:mercado_v2/features/auth/presentation/screens/app_shell_prov.dart';
import 'package:mercado_v2/features/auth/presentation/screens/login_screen.dart';
import 'package:mercado_v2/features/auth/presentation/screens/splash_screen.dart';
import 'package:mercado_v2/features/auth/presentation/screens/verify_email_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.when(
          authenticated: () => AppShellProv(),
          notAuthenticated: () => LoginScreen(),
          loading: () => SplashScreen(),
          authenticatedUnverified: () => VerifyEmailScreen(),
          
        );
      },
    );
  }
}
