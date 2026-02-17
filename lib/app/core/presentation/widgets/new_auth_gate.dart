import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/presentation/blocs/auth_gate/newauth_gate_bloc.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/presentation/blocs/auth_gate/newauth_gate_state.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/presentation/screens/login_screen.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/presentation/screens/splash_screen.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/presentation/screens/verify_email_screen.dart';

class NewAuthGate extends StatelessWidget {
  const NewAuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewauthGateBloc, NewAuthGateState>(
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
