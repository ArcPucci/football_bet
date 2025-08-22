import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class BetsControllers extends StatelessWidget {
  const BetsControllers({
    super.key,
    this.winController,
    this.drawController,
    this.loseController,
  });

  final TextEditingController? winController;
  final TextEditingController? drawController;
  final TextEditingController? loseController;

  @override
  Widget build(BuildContext context) {
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
          final controller = index == 0
              ? winController
              : index == 1
              ? loseController
              : drawController;
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
                Expanded(
                  child: TextField(
                    controller: controller,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.cns12,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4),
                      DecimalTextInputFormatter(),
                    ],
                    decoration: InputDecoration.collapsed(
                      hintText: '0.00',
                      hintStyle: AppTextStyles.cns12.copyWith(
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
