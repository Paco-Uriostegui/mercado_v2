// import 'package:flutter/material.dart';
// import 'package:mercado_v2/app/core/result/result.dart';
// import 'package:mercado_v2/features/auth/data/datasources/iuser_local_data_source.dart';
// import 'package:mercado_v2/features/auth/data/mappers/auth_user_mapper.dart';
// import 'package:mercado_v2/features/auth/data/models/local_user_model.dart';
// import 'package:mercado_v2/features/auth/domain/entities/auth_user/auth_user.dart';
// import 'package:mercado_v2/features/auth/domain/entities/user/user.dart';
// import 'package:mercado_v2/features/auth/domain/repositories/iauth_repository.dart';

// class CheckSessionUsecase {
//   final IAuthRepository _authRepository;
//   final IuserLocalDataSource _iuserLocalDataSource;
//   final AuthUserMapper _authUserMapper;

//   CheckSessionUsecase({
//     required IAuthRepository authRepository,
//     required IuserLocalDataSource iuserLocalDataSource,
//     required AuthUserMapper authUserMapper,
//   }) : _authRepository = authRepository,
//        _iuserLocalDataSource = iuserLocalDataSource,
//        _authUserMapper = authUserMapper;

//   Future<Result<User?>> call() async {

//     // ---------------------------------- AuthUser exists?
    


//     final result = await _authRepository.tryGetRefreshedCurrentUser();
//     result.when(
//       success: (value) {
//         if (value == null) {
//           return Result.success(null);
//         }

//         // ---------------------------- refreshed AuthUser exists -----





//       },
//       failure: (failure) => Result.failure(failure),
//     );
//   }
// }
//  // debe mirar si existe un authUser(authUser es dominio ya mapeado de firebaseUser) en el token de firebase
//   // si no existe navega a login

//   // si existe authUser, lo usa para buscar el localUserModel en la DB local,
//   // si lo encuentra, lo mapea a user y actualiza el estado y navega a home

//   // si no encuentra localUserModel en DB local, significa que el user pudo haber borrado la app,
//   // entonces lo busca en firestore
//   // es imposible que no esté porque si no no se habría generado un AuthUser mapeado (con refresh) desde un firebaseUser

//   // lo encuentra en la firestore, lo descarga, mapea a user y actualiza el estado a user y navega a home

