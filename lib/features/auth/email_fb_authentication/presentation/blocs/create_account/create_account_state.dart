import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_state.freezed.dart';

@freezed
sealed class CreateAccountState with _$CreateAccountState {
  const factory CreateAccountState.initial() = Initial;
  //const factory CreateAccountState.error(Failure failure) = Error;
  const factory CreateAccountState.loading() = Loading;
  const factory CreateAccountState.success() = Success;
  const factory CreateAccountState.weakPassword() = WeakPassword;
  const factory CreateAccountState.invalidEmail() = InvalidEmail;
  const factory CreateAccountState.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory CreateAccountState.networkError() = NetworkError;

}
