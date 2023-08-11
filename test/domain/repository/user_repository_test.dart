import 'package:bloc_first/domain/model/userModel.dart';
import 'package:bloc_first/domain/service/user_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("user repository test", () {
    test("error api ", () async {
      final UserService _userService = UserService();
      final Either<String, List<UserModel>> _response =
          await _userService.getUser();
      expect(_response.isRight(), true);

      final Either<String, List<UserModel>> response =
          await _userService.updateUser();
      expect(response.isRight(), true);
    });

    // Api bir xil bolgani uchun bir xil test hisoblanadi
    // va service ni test qilish xuddi shunday
  });
}
