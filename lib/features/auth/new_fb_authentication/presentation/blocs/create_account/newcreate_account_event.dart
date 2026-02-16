import 'package:freezed_annotation/freezed_annotation.dart';

part 'newcreate_account_event.freezed.dart';

@freezed
sealed class NewCreateAccountEvent with _$NewCreateAccountEvent {

  const factory NewCreateAccountEvent.createAccountSubmitted({
    required String email,
    required String password,
  }) = CreateAccountSubmitted;
  const factory NewCreateAccountEvent.loginButtonPressed() = LoginButtonPressed;
  const factory NewCreateAccountEvent.restorePasswordButtonPressed() = RestorePasswordButtonPressed;
}
