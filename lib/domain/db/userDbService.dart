import 'dart:io';

import 'package:bloc_first/domain/model/userModel.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class UserDBService {
  Box<UserModel>? box;

  Future<void> openbox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    box = await Hive.openBox<UserModel>("data");
  }

  Future<void> writeToDB(List<UserModel> data) async {
    await openbox();
    await box!.addAll(data);
    print(box!.values);
  }

  static void registerAdapter() async {
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(AddressAdapter());
    Hive.registerAdapter(CompanyAdapter());
    Hive.registerAdapter(GeoAdapter());
  }

  // Future<void> updateData() async {
  //   dynamic res = await _userService.updateUser();
  //   await openbox();
  // }
}
