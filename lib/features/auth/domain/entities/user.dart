import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  


  const User({
    required this.uid,
    this.email,
    this.profileImageLocalPath,
  });

  @override
  final String uid;
  @override
  final String? email;
  @override
  final String? profileImageLocalPath;
}