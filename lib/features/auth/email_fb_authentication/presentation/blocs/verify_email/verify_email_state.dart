import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_state.freezed.dart';

@freezed
sealed class VerifyEmailState with _$VerifyEmailState {
  const factory VerifyEmailState.initial() = Initial;
  //const factory VerifyEmailState.emailConfirmed() = EmailConfirmed;
  const factory VerifyEmailState.loading() = Loading;
  const factory VerifyEmailState.error() = Error;
  const factory VerifyEmailState.emailSent() = EmailSent;
  const factory VerifyEmailState.notVerifiedYetMessage() =
      NotVerifiedYetMessage;
}
