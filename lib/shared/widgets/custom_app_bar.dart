import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/core/core.dart';
import 'package:football_bet/shared/widgets.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    this.child,
    this.hasBack = false,
  });

  final bool hasBack;
  final String text;
  final List<Widget>? child;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Stack(
      children: [
        ClipPath(
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
              child: Row(
                children: [
                  if (hasBack) ...[
                    GestureDetector(
                      onTap: context.pop,
                      child: Image.asset(
                        'assets/png/back.png',
                        width: 24.r,
                        height: 24.r,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 5.w),
                  ],
                  Text(text, style: AppTextStyles.cn16_700),
                ],
              ),
            ),
          ),
        ),
        Positioned(right: 0, bottom: 0, child: ProfileButtons()),
      ],
    );
  }
}
