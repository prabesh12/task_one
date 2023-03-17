import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/pages/form/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputLayout extends GetView<UserController> {
  final String label;
  final String hintTexts;
  final TextEditingController inputController;
  const InputLayout(
      {required this.hintTexts,
      super.key,
      required this.label,
      required this.inputController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label :",
          style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          validator: (value) {
            return "This is required field";
          },
          style:
              TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 16.sp),
          autofocus: false,
          controller: inputController,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              hintText: hintTexts,
             
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 1))),
        ),
        SizedBox(
          height: 16.h,
        )
      ],
    );
  }
}
