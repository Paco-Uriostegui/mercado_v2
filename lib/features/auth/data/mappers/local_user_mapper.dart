import 'package:mercado_v2/core/result/result.dart';
import 'package:mercado_v2/core/result/result_extensions.dart';
import 'package:mercado_v2/features/auth/data/models/local_user_model.dart';
import 'package:mercado_v2/features/auth/domain/entities/user/user.dart';
import 'package:mercado_v2/features/auth/domain/value_objects/user/value_objects_export.dart';

class LocalUserMapper {
  LocalUserModel userToLocalModel(User user) {
    return LocalUserModel(
      id: user.uid,
      email: user.email.value,
      firstName: user.firstName.value,
      lastName: user.lastName.value,
      secondLastName: user.secondLastName.value,
    );
  }

  User localModeltoDomain(LocalUserModel localUser) {
    try {
      return User(
        uid: localUser.id,
        firstName: FirstName(localUser.firstName),
        lastName: LastName(localUser.lastName),
        secondLastName: SecondLastName(localUser.secondLastName),
        email: Email.direct(localUser.email),
      );
    } catch (e) {
      rethrow;
    }
  }
}
