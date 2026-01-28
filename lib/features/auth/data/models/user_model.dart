import 'package:mercado_v2/features/auth/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

class UserModel extends User {
  UserModel({required super.uid});

  factory UserModel.fromFirebaseUser(fb.User firebaseUser) {
    return UserModel(uid: firebaseUser.uid);
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(uid: user.uid);
  }
}
