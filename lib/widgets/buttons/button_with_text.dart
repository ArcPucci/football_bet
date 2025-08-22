import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.text,
    this.buttonColor,
    this.onTap,
    this.width,
    this.height,
    this.enabled = true,
  });

  final String text;
  final double? width;
  final double? height;
  final Color? buttonColor;
  final VoidCallback? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 139.r,
        height: height ?? 45.r,
        decoration: BoxDecoration(
          color: buttonColor ?? AppTheme.red,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(text, style: AppTextStyles.cns15),
      ),
    );
  }
}
