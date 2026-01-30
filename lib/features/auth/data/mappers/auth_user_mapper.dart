import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:mercado_v2/core/result/failure.dart';
import 'package:mercado_v2/features/auth/domain/entities/auth_user/auth_user.dart';

class AuthUserMapper {
  AuthUser fromFirebase(fb.User firebaseUser) {
    if (firebaseUser.uid.isEmpty) {
      throw AuthException('firebaseUser id is empty');
    }
    return AuthUser(uid: firebaseUser.uid);
  }
}
