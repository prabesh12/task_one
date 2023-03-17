import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:task1/common/widgets/button.dart';
import 'package:task1/common/widgets/input.dart';
import 'package:task1/pages/form/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormPage extends GetView<UserController> {
  FormPage({super.key});
  final UserController userController = Get.put(UserController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Add User"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
            child: Form(
              key: formKey,
              child: Column(children: [
                InputLayout(
                  hintTexts: "please enter your name",
                  label: "Enter your name",
                  inputController: controller.nameController,
                ),
                InputLayout(
                    hintTexts: "please enter your age",
                    label: "Enter your age",
                    inputController: controller.ageController),
                InputLayout(
                    hintTexts: "please enter your id",
                    label: "Enter your id",
                    inputController: controller.idController),
                InputLayout(
                    hintTexts: "Please enter description",
                    label: "Enter your description",
                    inputController: controller.descController),
                CustomButton(
                  handlePress: () {
                    if (formKey.currentState!.validate()) {
                      userController.saveUser();
                      Get.snackbar(
                          "Toast Message", "Data has been saved successfully",
                          snackPosition: SnackPosition.TOP,
                          duration: const Duration(seconds: 2));
                    }
                  },
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
