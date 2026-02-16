import 'package:freezed_annotation/freezed_annotation.dart';

part 'newauth_gate_event.freezed.dart';

@freezed
sealed class NewAuthGateEvent with _$NewAuthGateEvent{
  const factory NewAuthGateEvent.initStream() = InitStream;
}