import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:mercado_v2/core/result/failure.dart';

import '../../domain/entities/user.dart';

class UserMapper {
  User fromFirebase(fb.User firebaseUser) {
    if (firebaseUser.uid.isEmpty) {
      throw AuthException('firebaseUser id is empty');
    }
    return User(uid: firebaseUser.uid);
  }
}
