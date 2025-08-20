import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    super.key,
    required this.text,
    this.onTap,
    this.width,
    this.height,
    this.textStyle,
    this.borderRadius,
    this.color,
  });

  final String text;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final double? borderRadius;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 245.w,
        height: height ?? 45.h,
        decoration: BoxDecoration(
          color: color ?? AppTheme.red,
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
        ),
        alignment: Alignment.center,
        child: Text(text, style: textStyle ?? AppTextStyles.cns15),
      ),
    );
  }
}
