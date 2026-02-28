import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/i_auth_gate.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/i_auth_repository.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/authenticate_usecase.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/confirm_email_verification_usecase.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/create_account_usecase.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/login_usecase.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/resend_verification_email_usecase.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  // ---------- Repositories
  IAuthRepository,
  // ----------- UseCases
  AuthenticationUseCase,
  CreateAccountUsecase,
  LoginUsecase,
  ConfirmEmailVerificationUseCase,
  ResendVerificationEmailUsecase,
  // -------------- Others
  IAuthGateStream,
  ])

void main() {}
