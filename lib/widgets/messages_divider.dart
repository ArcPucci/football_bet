import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class MessagesDivider extends StatelessWidget {
  const MessagesDivider({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Opacity(opacity: 0.5, child: Text(text, style: AppTextStyles.cn14_400)),
          SizedBox(width: 10.w),
          Expanded(
            child: Container(
              height: 1.sp,
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
