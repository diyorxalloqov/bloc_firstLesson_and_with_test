import 'dart:convert';

import 'package:bloc_first/domain/model/userModel.dart';
import 'package:bloc_first/presentation/core/api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UserService {
  Future<Either<String, List<UserModel>>> getUser() async {
    try {
      Response response = await Dio().get(Api.api,);
      if (response.statusCode == 200) {
        return right((response.data as List)
            .map((e) => UserModel.fromJson(jsonEncode(e)))
            .toList());
      } else {
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      return left(e.message.toString());
    }
  }

  Future<Either<String, List<UserModel>>> signUp(
      String name, String lname, String email, String password) async {
    try {
      Response response = await Dio().get(Api.api);
      if (response.statusCode == 200) {
        return right((response.data as List)
            .map((e) => UserModel.fromJson(jsonEncode(e)))
            .toList());
      } else {
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      return left(e.message.toString());
    }
  }

  Future<Either<String, List<UserModel>>> updateUser() async {
    try {
      Response response = await Dio().get(Api.api);
      if (response.statusCode == 200) {
        var s = (response.data as List)
            .map((e) => UserModel.fromJson(jsonEncode(e)))
            .toList();
        s[0] = s[0].copyWith(name: "Updated");
        return right(s);
      } else {
        return left(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      return left(e.message.toString());
    }
  }
}
