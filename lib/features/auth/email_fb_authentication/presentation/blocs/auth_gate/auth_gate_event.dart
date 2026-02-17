import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_gate_event.freezed.dart';

@freezed
sealed class AuthGateEvent with _$AuthGateEvent {
  const factory AuthGateEvent.initStream() = InitStream;
}
