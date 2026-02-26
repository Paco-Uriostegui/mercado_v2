import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/usecases/create_account_usecase.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/create_account/create_account_event.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/presentation/blocs/create_account/create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  final CreateAccountUsecase _usecase;

  CreateAccountBloc({required CreateAccountUsecase usecase})
    : _usecase = usecase,
      super(CreateAccountState.initial()) {
    on<CreateAccountSubmitted>(_onCreateAccountSubmitted);
  }

  Future<void> _onCreateAccountSubmitted(
    CreateAccountSubmitted event,
    Emitter<CreateAccountState> emit,
  ) async {
    emit(.loading());
    final result = await _usecase(
      emailString: event.email,
      passwordString: event.password,
    );
    result.when(
      success: (value) => emit(CreateAccountState.success()),
      failure: (failure) {
        emit(switch (failure) {

 
          // TODO: Handle this case.
          EmailAlreadyInUseFailure() => throw UnimplementedError(),
          // TODO: Handle this case.
          InvalidEmailFormatFailure() => throw UnimplementedError(),
          // TODO: Handle this case.
          WeakPasswordFailure() => throw UnimplementedError(),
          // TODO: Handle this case.
          OperationNotAllowedFailure() => throw UnimplementedError(),
          // TODO: Handle this case.
          TooManyRequestsFailure() => throw UnimplementedError(),
          // TODO: Handle this case.
          UserTokenExpiredFailure() => throw UnimplementedError(),
          // TODO: Handle this case.
          BackendUserIsNullFailure() => throw UnimplementedError(),
          // TODO: Handle this case.
          NetworkRequestFailedFailure() => throw UnimplementedError(),
          // TODO: Handle this case.
          UserDisabledFailure() => throw UnimplementedError(),
          // TODO: Handle this case.
          UserNotFoundFailure() => throw UnimplementedError(),
          // TODO: Handle this case.
          WrongPasswordFailure() => throw UnimplementedError(),
          // TODO: Handle this case.
          InvalidLoginCredentialsFailure() => throw UnimplementedError(),
          // TODO: Handle this case.
          InvalidPasswordFormatFailure() => throw UnimplementedError(),
          // TODO: Handle this case.
          UnknownAuthFailure() => throw UnimplementedError(),
        });
      },
    );
  }
}
