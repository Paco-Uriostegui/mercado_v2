import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_event.freezed.dart';

@freezed
sealed class VerifyEmailEvent with _$VerifyEmailEvent {
  const factory VerifyEmailEvent.onVerifiedPressed() = OnVerifiedPressed;
  const factory VerifyEmailEvent.resendVerificationEmail() =
      ResendVerificationEmail;
}
