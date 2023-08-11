import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UserMockService {
  Future<Either<String, String>> signUp(Map<String, dynamic> userModel) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return right("YOU REGISTERED SUCCESSFULLY!");
    } on DioException catch (e) {
      return left(e.message.toString());
    }
  }
}