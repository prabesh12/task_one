import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/common/widgets/search.dart';
import 'package:task1/common/widgets/user_card.dart';
import 'package:task1/pages/form/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowUsers extends GetView<UserController> {
  ShowUsers({super.key});
  final UserController showUsers = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          CustomSearchBar(),
        ],
        title: const Text("User Data"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                const Spacer(
                  flex: 1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: ListView.builder(
                      itemCount: showUsers.allUser.length,
                      itemBuilder: (context, index) {
                        final users = showUsers.allUser[index];
                        return userCard(
                            age: users!.age,
                            name: users.username,
                            desc: users.description);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
