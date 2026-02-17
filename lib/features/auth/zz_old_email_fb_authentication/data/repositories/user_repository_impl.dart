// import 'package:mercado_v2/app/core/result/failure.dart';
// import 'package:mercado_v2/app/core/result/result.dart';
// import 'package:mercado_v2/features/auth/email_fb_authentication/data/datasources/user_shared_pref_data_source_impl.dart';
// import 'package:mercado_v2/features/auth/email_fb_authentication/data/mappers/local_user_mapper.dart';
// import 'package:mercado_v2/features/auth/email_fb_authentication/data/models/local_user_model.dart';
// import 'package:mercado_v2/features/auth/email_fb_authentication/domain/entities/user/user.dart';
// import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/iuser_repository.dart';

// TODO poner un origin a cada metodo para saber de donde vienen de DB local o remota

// class UserRepositoryImpl implements IUserRepository {
//   final UserSharedPrefDataSourceImpl _prefDataSourceImpl;
//   final LocalUserMapper _mapper;

//   UserRepositoryImpl({
//     required UserSharedPrefDataSourceImpl prefDataSourceImpl,
//     required LocalUserMapper mapper,
//   }) : _prefDataSourceImpl = prefDataSourceImpl,
//        _mapper = mapper;
//   @override
//   Future<Result<User?>> getUser(String id) async {
//     try {
//       final LocalUserModel? localModel = await _prefDataSourceImpl
//           .getLocalModel(id);
//       if (localModel == null) {
//         return Result.success(null);
//       }
//       final User user = _mapper.localModeltoDomain(localModel);
//       return Result.success(user);
//     } catch (e) {
//       return Result.failure(LocalUserException.errorGettingUser());
//     }
//   }

//   @override
//   Future<Result<void>> removeUser(String id) async {
//     try {
//       await _prefDataSourceImpl.remove(id);
//       return Result.success(null);
//     } catch (e) {
//       return Result.failure(LocalUserException.errorRemovingUser());
//     }
//   }

//   @override
//   Future<Result<void>> saveUser(User user) async {
//     try {
//       final String uid = user.uid;
//       final LocalUserModel localModel = _mapper.userToLocalModel(user);
//       await _prefDataSourceImpl.saveLocalModel(localModel, uid);
//       return Result.success(null);
//     } catch (e) {
//       return Result.failure(LocalUserException.errorWhileSavingUser());
//     }
//   }
// }
