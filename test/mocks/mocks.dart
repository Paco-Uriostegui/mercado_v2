import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/i_auth_repository.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/authenticate_usecase.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/create_account_usecase.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/login_usecase.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/create_account/create_account_event.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  // ---------- Repositories
  IAuthRepository,
  // ----------- UseCases
  AuthenticationUseCase,
  CreateAccountUsecase,
  LoginUsecase,
  ])

void main() {}
