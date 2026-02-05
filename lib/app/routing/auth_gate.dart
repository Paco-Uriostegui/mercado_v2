import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercado_v2/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:mercado_v2/features/auth/presentation/bloc/auth/auth_state.dart';
import 'package:mercado_v2/features/auth/presentation/screens/login_screen.dart';
import 'package:mercado_v2/features/auth/presentation/screens/splash_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.when(
          authenticated: (authUser) => AppShell(),
          notAuthenticated: () => LoginScreen(),
          loading: () => SplashScreen(),
        );
      },
    );
  }
}
