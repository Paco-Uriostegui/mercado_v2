import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';

@freezed
class AuthUser with _$AuthUser{
  @override
  final String uid;
  @override
  final bool? hasVerifyEmail;

  AuthUser({required this.uid, this.hasVerifyEmail});
} 