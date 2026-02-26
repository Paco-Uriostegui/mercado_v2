import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';

@freezed
class AuthUser with _$AuthUser {
  @override
  final String uid;
  @override
  final String? name;
  @override
  final bool isEmailVerified;

  AuthUser({
    required this.uid,
    this.name,
    required this.isEmailVerified,
  });
}
