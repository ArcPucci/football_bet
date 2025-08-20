import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({super.key, required this.text, this.onTap});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 245.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: AppTheme.red,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(text, style: AppTextStyles.cns15),
      ),
    );
  }
}
