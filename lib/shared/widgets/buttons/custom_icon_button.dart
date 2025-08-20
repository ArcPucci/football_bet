import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.asset, this.onTap});

  final String asset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 47.r,
        height: 47.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.black4,
        ),
        alignment: Alignment.center,
        child: Image.asset(asset, width: 24.r, height: 24.r, fit: BoxFit.fill),
      ),
    );
  }
}
