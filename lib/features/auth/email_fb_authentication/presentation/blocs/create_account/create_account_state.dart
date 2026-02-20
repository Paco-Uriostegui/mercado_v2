import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mercado_v2/app/core/result/failure.dart';

part 'create_account_state.freezed.dart';

@freezed
sealed class CreateAccountState with _$CreateAccountState {
  const factory CreateAccountState.initial() = Initial;
  //const factory CreateAccountState.error(Failure failure) = Error;
  const factory CreateAccountState.loading() = Loading;
  const factory CreateAccountState.success() = Success;
  const factory CreateAccountState.weakPassword() = WeakPassword;
  const factory CreateAccountState.emailInvalid() = EmailInvalid;
  const factory CreateAccountState.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory CreateAccountState.connectionError() = ConnectionError;
  const factory CreateAccountState.genericError() = UnknownError;

}
