import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/bloc/auth/auth_bloc.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/bloc/auth/auth_state.dart';
import 'package:mercado_v2/features/home_app_shell/presentation/screens/app_shell_prov.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/screens/login_screen.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/screens/splash_screen.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/screens/verify_email_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.when(
          authenticated: () => HomeAppShellProvisional(),
          notAuthenticated: () => LoginScreen(),
          loading: () => SplashScreen(),
          authenticatedUnverified: () => VerifyEmailScreen(),
          
        );
      },
    );
  }
}
