import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';

@freezed
class AuthUser with _$AuthUser{
  @override
  final String uid;
  @override
  final bool isEmailVerified;
  @override
  final bool? isProfileCompleted;

  AuthUser({required this.uid, required this.isEmailVerified, this.isProfileCompleted});

} 