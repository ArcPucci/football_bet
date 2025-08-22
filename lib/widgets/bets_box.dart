import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class BetsBox extends StatelessWidget {
  const BetsBox({
    super.key,
    required this.win,
    required this.loss,
    required this.draw,
  });

  final double win;
  final double loss;
  final double draw;

  @override
  Widget build(BuildContext context) {
    final list = [win, loss, draw];
    return Container(
      width: 289.w,
      height: 41.h,
      decoration: BoxDecoration(
        color: AppTheme.black,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(3, (index) {
          return Container(
            width: 90.w,
            height: 35.h,
            decoration: BoxDecoration(
              color: AppTheme.black3,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1x",
                  style: AppTextStyles.cn12_400.copyWith(color: AppTheme.grey),
                ),
                Text(list[index].toString(), style: AppTextStyles.cn12_700),
              ],
            ),
          );
        }),
      ),
    );
  }
}
