import 'package:flutter/material.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/iauth_gate.dart';
import 'package:mercado_v2/features/home_app_shell/presentation/screens/app_shell_prov.dart';

class GateKeeper extends StatelessWidget {
  final IAuthGate _iAuthGate;
  final Widget authEntryPoint;

  const GateKeeper({super.key, required IAuthGate iAuthGate, required this.authEntryPoint}) : _iAuthGate = iAuthGate;

  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: _iAuthGate.authenticationGateStream, builder: 
    (context, snapshot) {
      if (snapshot.hasData) {
        return const HomeAppShellProvisional();
      } else {
        return authEntryPoint;
      }
    },);
  }
}