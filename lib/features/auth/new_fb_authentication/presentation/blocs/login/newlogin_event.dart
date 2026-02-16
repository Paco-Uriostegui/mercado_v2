
import 'package:freezed_annotation/freezed_annotation.dart';

part 'newlogin_event.freezed.dart';

@freezed
sealed class NewLoginEvent with _$NewLoginEvent {
  const factory NewLoginEvent.loginSubmitted({
    required String email,
    required String password,
  }) = NewLoginSubmitted;
}