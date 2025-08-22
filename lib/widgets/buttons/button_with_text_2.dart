import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';

class ButtonWithText2 extends StatelessWidget {
  const ButtonWithText2({super.key, required this.text, this.onTap});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 325.r,
        height: 45.r,
        decoration: BoxDecoration(
          color: AppTheme.red,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(text, style: AppTextStyles.cn15_700),
      ),
    );
  }
}
