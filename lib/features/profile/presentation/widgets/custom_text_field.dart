import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.title, this.controller});

  final String title;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330.w,
      height: 86.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(title, style: AppTextStyles.cns14),
            ),
          ),
          Container(
            width: 330.w,
            height: 64.h,
            decoration: BoxDecoration(
              color: AppTheme.black,
              borderRadius: BorderRadius.circular(25),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.center,
            child: TextField(
              controller: controller,
              style: AppTextStyles.cn14_400,
              decoration: InputDecoration.collapsed(
                hintText: 'Tape here',
                hintStyle: AppTextStyles.cn14_400.copyWith(
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
