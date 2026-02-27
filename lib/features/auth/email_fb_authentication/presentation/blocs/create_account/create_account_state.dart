import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_state.freezed.dart';

@freezed
sealed class CreateAccountState with _$CreateAccountState {
  const factory CreateAccountState.initial() = Initial;
  //const factory CreateAccountState.error(Failure failure) = Error;
  const factory CreateAccountState.loading() = Loading;
  const factory CreateAccountState.created() = Created;
  const factory CreateAccountState.weakPassword() = WeakPassword;
  const factory CreateAccountState.invalidEmailFormat() = InvalidEmailFormat;
  const factory CreateAccountState.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory CreateAccountState.networkError() = NetworkError;
  const factory CreateAccountState.unknown() = Unknown;
  const factory CreateAccountState.tooManyRequests() = TooManyRequests;
}
