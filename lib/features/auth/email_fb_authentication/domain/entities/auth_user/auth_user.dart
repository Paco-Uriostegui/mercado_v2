import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';

@freezed
class AuthUser with _$AuthUser{
  @override
  final String uid;
  @override
  final bool isEmailVerified;
  @override
  final String? name;

  AuthUser({required this.uid, required this.isEmailVerified, required this.name});

} 