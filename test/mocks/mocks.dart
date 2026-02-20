import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/iauth_repository.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/authenticate_usecase.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/create_account_usecase.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  // ---------- Repositories
  IAuthRepository,
  // ----------- UseCases
  AuthenticationUseCase,
  CreateAccountUsecase,
  ])
void main() {}
