



import 'package:firebase_auth/firebase_auth.dart' as fb;

import '../../domain/entities/user.dart';

class UserMapper {
  
  User fromFirebase(fb.User firebaseUser) {
    return User(uid: firebaseUser.uid);
  }
}