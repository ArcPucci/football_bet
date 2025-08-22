import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    super.key,
    required this.text,
    required this.toggled,
    this.onTap,
  });

  final String text;
  final bool toggled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: toggled ? AppTheme.black : null,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Container(
          width: 325.w,
          height: 45.h,
          decoration: BoxDecoration(
            color: AppTheme.red,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: AppTextStyles.cns15),
              SizedBox(width: 5.w),
              RotatedBox(
                quarterTurns: toggled ? 1 : -1,
                child: Image.asset(
                  'assets/png/back.png',
                  width: 24.r,
                  height: 24.r,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
