import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mercado_v2/app/core/result/failure.dart';

part 'newcreate_account_state.freezed.dart';

@freezed
sealed class NewCreateAccountState with _$NewCreateAccountState {
  const factory NewCreateAccountState.initial() = Initial;
  const factory NewCreateAccountState.error(Failure failure) = Error;
  const factory NewCreateAccountState.loading() = Loading;
  const factory NewCreateAccountState.success() = Success;
  //const factory NewCreateAccountState.successWithIncompleteProfile() = SuccessWithIncompleteProfile;
}
