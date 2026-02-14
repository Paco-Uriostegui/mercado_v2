
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_auth_user.freezed.dart';

@freezed

class NewAuthUser with _$NewAuthUser {
  @override
  final String uid;
  @override
  final String? name;
  @override
  final bool isEmailVerified;

  NewAuthUser({required this.uid, required this.name, required this.isEmailVerified});
}