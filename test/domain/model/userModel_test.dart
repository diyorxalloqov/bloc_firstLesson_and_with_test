import 'package:bloc_first/domain/model/userModel.dart';
import 'package:bloc_first/domain/service/userMockService.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("User Model test \n", () {
    test("should return failure when user not input data properly", () async {
      UserModel userModel = const UserModel(
        email: "adasd@wrf",
        id: 1,
        name: "adas",
        phone: "998933974325",
        username: "asasd",
        website: "awdawd",
        company: Company(bs: "asdas", catchPhrase: "asdasd", name: "awdas"),
        address: Address(
          city: "Tashkent",
          geo: Geo(lat: "asda", lng: "asdas"),
          street: "awdas",
          suite: "asdasd",
          zipcode: "adasd",
        ),
      );
      UserMockService userMockService = UserMockService();
      Either<String, String> res = await userMockService.signUp(userModel.toMap());
      expect(res.isRight(), true);
    });
  });
}
