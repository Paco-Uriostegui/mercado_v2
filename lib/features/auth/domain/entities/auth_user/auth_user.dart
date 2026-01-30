import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';

@freezed
class AuthUser with _$AuthUser{
  @override
  final String uid;

  AuthUser({required this.uid});
} 