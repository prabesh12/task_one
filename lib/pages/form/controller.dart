import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/common/services/storage.dart';

import '../../common/entity/user.dart';

class UserController extends GetxController {
  final state = FormState();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final idController = TextEditingController();
  final descController = TextEditingController();
  List<User?> allUser = [];

  UserController();
  @override
  void onInit() {
    getUsersData();
    super.onInit();
  }

  void saveUser() async {
    sharePreference.setUser(
      name: nameController.text,
      desc: descController.text,
      age: int.parse(ageController.text),
      id: int.parse(idController.text),
    );
    nameController.clear();
    ageController.clear();
    idController.clear();
    descController.clear();
  }

  void getUsersData() {
    allUser = sharePreference.getUsers() ?? [];
  }

  void searchUserByUsername(String username) {
    List<User?> filteredList = allUser;
    allUser = [];
    // for (final user in filteredList) {
    //   if (user != null && user.username == username) {
    //     allUser.add(user);
    //   }
    // }
    for (var user in filteredList) {
      if (user != null && user.username == username) {
        allUser.add(user);
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    idController.dispose();
    descController.dispose();
    super.dispose();
  }
}
