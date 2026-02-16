import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mercado_v2/app/core/result/failure.dart';

part 'newlogin_state.freezed.dart';

@freezed
sealed class NewLoginState with _$NewLoginState {
  const factory NewLoginState.initial() = _Initial;
  const factory NewLoginState.loading() = _Loading;
  const factory NewLoginState.success() = _Success;
  const factory NewLoginState.failure(Failure failure) = _Error;
}