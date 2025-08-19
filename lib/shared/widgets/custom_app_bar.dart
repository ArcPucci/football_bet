import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/core/core.dart';

import '../../features/welcome/welcome.dart';
import 'clippers/app_bar_clipper.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return ClipPath(
      clipper: AppBarClipper(
        radius: 40,
        cutRectWidth: 217.w,
        cutRectHeight: 55.h,
      ),
      child: Container(
        width: 390.w,
        height: 55.h + topPadding,
        color: AppTheme.black,
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(left: 20.w),
        child: SizedBox(
          height: 55.h,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(text, style: AppTextStyles.cn16_700),
          ),
        ),
      ),
    );
  }
}
