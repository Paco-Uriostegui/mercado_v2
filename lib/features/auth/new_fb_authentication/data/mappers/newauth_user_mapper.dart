import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:mercado_v2/app/core/result/failure.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/entities/auth_user/new_auth_user.dart';

class NewAuthUserMapper {
  NewAuthUser fromFirebase(fb.User firebaseUser) {
    if (firebaseUser.uid.isEmpty) {
      throw AuthException();
    }
    return NewAuthUser(
      uid: firebaseUser.uid,
      isEmailVerified: firebaseUser.emailVerified,
      name: firebaseUser.displayName,
    );
  }
}