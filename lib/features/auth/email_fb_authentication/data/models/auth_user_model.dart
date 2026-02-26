


import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/entities/auth_user/auth_user.dart';

part 'auth_user_model.freezed.dart';

@freezed 
class AuthUserModel with _$AuthUserModel {
  @override
  final String uid;
  @override
  final String? name;
  @override
  final bool isEmailVerified;


  AuthUserModel({required this.uid, required this.name, required this.isEmailVerified});

  factory AuthUserModel.fromFirebase(fb.User firebaseUser) {
    return AuthUserModel(
      uid: firebaseUser.uid,
      isEmailVerified: firebaseUser.emailVerified,
      name: firebaseUser.displayName ?? ""
    );
  }

  AuthUser toEntity() {
    return AuthUser(uid: uid, isEmailVerified: isEmailVerified);
  }






}