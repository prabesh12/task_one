import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task1/pages/form/controller.dart';

class CustomSearchBar extends GetView<UserController> {
  CustomSearchBar({super.key});
  final TextEditingController searcController = TextEditingController();
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: AnimSearchBar(
          width: 250.w,
          animationDurationInMilli: 400,
          textController: searcController,
          onSuffixTap: () {},
          onSubmitted: (String userName) {
            userController.searchUserByUsername(searcController.text);
          }),
    );
  }
}
