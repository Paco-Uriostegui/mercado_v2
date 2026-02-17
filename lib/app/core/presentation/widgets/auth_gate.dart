import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/auth_gate/auth_gate_bloc.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/auth_gate/auth_gate_state.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/screens/login_screen.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/screens/splash_screen.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/screens/verify_email_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthGateBloc, AuthGateState>(
      builder: (context, state) {
        return state.when(
          loading: () => SplashScreen(),
          goToLogin: () => LoginScreen(),
          goToVerifyEmail: () => VerifyEmailScreen(),
        );
      },
    );
  }
}
