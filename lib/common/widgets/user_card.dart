import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget userCard({String? name, String? desc, required int age}) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(12.w),
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.05),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  name ?? "",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  desc ?? "",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Text(
              "Age: $age",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
      SizedBox(
        height: 8.h,
      )
    ],
  );
}
