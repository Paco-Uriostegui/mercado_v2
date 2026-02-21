import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:mercado_v2/app/core/data/failure.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/entities/auth_user/auth_user.dart';

class AuthUserMapper {
  AuthUser fromFirebase(fb.User firebaseUser) {
    if (firebaseUser.uid.isEmpty) {
      throw AuthFailure();
    }
    return AuthUser(
      uid: firebaseUser.uid,
      isEmailVerified: firebaseUser.emailVerified,
      name: firebaseUser.displayName,
    );
  }
}
