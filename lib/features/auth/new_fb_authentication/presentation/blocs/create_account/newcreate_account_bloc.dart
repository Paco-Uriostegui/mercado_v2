
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/usecases/newcreate_account_usecase.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/presentation/blocs/create_account/newcreate_account_event.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/presentation/blocs/create_account/newcreate_account_state.dart';

class NewCreateAccountBloc extends Bloc<NewCreateAccountEvent, NewCreateAccountState> {
  final NewCreateAccountUsecase _usecase;

  NewCreateAccountBloc({required NewCreateAccountUsecase usecase})
    : _usecase = usecase,
      super(NewCreateAccountState.initial()) {
    on<CreateAccountSubmitted>(_onCreateAccountSubmitted);
  }

  Future<void> _onCreateAccountSubmitted(
    CreateAccountSubmitted event,
    Emitter<NewCreateAccountState> emit,
  ) async {
    emit(.loading());
    final result = await _usecase(
      emailString: event.email,
      passwordString: event.password,
    );
    result.map(
      success: (value) => emit(.success()),
      failure: (failure) => emit(.error(failure.failure)),
    );
  }
}
