import 'package:flutter/material.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/iauth_gate.dart';
import 'package:mercado_v2/features/home_app_shell/presentation/screens/home_app_shell_prov.dart';

class GateKeeper extends StatefulWidget {
  final IAuthGateStream _iAuthGateStream;
  final Widget authEntryPoint;

  const GateKeeper({
    super.key,
    required IAuthGateStream iAuthGate,
    required this.authEntryPoint,
  }) : _iAuthGateStream = iAuthGate;

  @override
  State<GateKeeper> createState() => _GateKeeperState();
}

class _GateKeeperState extends State<GateKeeper> {
  @override
  void initState() {
    super.initState();
    widget._iAuthGateStream.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget._iAuthGateStream.authenticationGateStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.data is AuthenticationSuccess) {
          return const HomeAppShellProvisional();
        } else {
          return widget.authEntryPoint;
        }
      },
    );
  }
}
