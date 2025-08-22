import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class CustomTextField2 extends StatelessWidget {
  const CustomTextField2({super.key, required this.hintText, this.controller});

  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
      decoration: BoxDecoration(
        color: AppTheme.black3,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: controller,
        minLines: 3,
        maxLines: null,
        style: AppTextStyles.cn10_700,
        decoration: InputDecoration.collapsed(
          hintText: hintText,
          hintStyle: AppTextStyles.cn10_700.copyWith(
            color: Colors.white.withValues(alpha: 0.5),
          ),
        ),
      ),
    );
  }
}
