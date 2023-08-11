import 'package:bloc_first/domain/db/userDbService.dart';
import 'package:bloc_first/domain/service/user_service.dart';
import 'package:dartz/dartz.dart';

import '../model/userModel.dart';

class UserRepository {
  
  final UserService _userService = UserService();
  final UserDBService _userDBService = UserDBService();

  Future<Either<String, List<UserModel>>> getUsers() async {
    await _userDBService.openbox();
    Either<String, List<UserModel>> res = await _userService.getUser();
    if (_userDBService.box!.isEmpty) {
      return res.fold(
        (error) => left(error),
        (data) async {
          await _userDBService.writeToDB(data);
          return right(data);
        },
      );
    } else {
      return right(_userDBService.box!.values.toList());
    }
  }

  Future<Either<String, List<UserModel>>> updateUsers() async {
    Either<String, List<UserModel>> res = await _userService.updateUser();
    return res.fold((error) => left(error), (data) => right(data));
  }

  Future<Either<String, List<UserModel>>> signUp(
      String name, String lname, String email, String password) async {
    Either<String, List<UserModel>> res =
        await _userService.signUp(name, lname, email, password);
    return res.fold((error) => left(error), (data) => right(data));
  }
}
