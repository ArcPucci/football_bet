import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/core.dart';

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.text,
    this.buttonColor,
    this.onTap,
  });

  final String text;
  final Color? buttonColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 139.r,
        height: 45.r,
        decoration: BoxDecoration(
          color: buttonColor ?? AppTheme.red,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(text, style: AppTextStyles.subtitle),
      ),
    );
  }
}
