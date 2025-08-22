import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class GameCard extends StatelessWidget {
  const GameCard({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 320.w,
        height: 262.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/png/rect1.png',
                width: 320.w,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              bottom: 20.h,
              child: Text(
                "WILL END IN: 1D:12H:30M",
                style: AppTextStyles.cn15_700,
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: 320.w,
                height: 207.h,
                decoration: BoxDecoration(
                  color: AppTheme.red,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                padding: EdgeInsets.only(top: 15.h, bottom: 8.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/png/soccer_ball.png',
                          width: 20.r,
                          height: 20.r,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: 5.w),
                        Text("SOCCER", style: AppTextStyles.cn14_700),
                      ],
                    ),
                    SizedBox(height: 7.h),
                    CommandsLogo(
                      firstLogo: 'assets/png/man_city.png',
                      secondLogo: 'assets/png/norwich_city.png',
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      width: 222.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "MAN\nCITY",
                            style: AppTextStyles.cn12_700,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Norwich\nCity",
                            style: AppTextStyles.cn12_700,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    BetsBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
