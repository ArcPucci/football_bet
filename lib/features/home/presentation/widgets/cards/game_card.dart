import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core.dart';

class GameCard extends StatelessWidget {
  const GameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  SizedBox(
                    width: 235.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/png/man_city.png',
                          width: 63.r,
                          height: 63.r,
                          fit: BoxFit.fill,
                        ),
                        Text("VS", style: AppTextStyles.cn20_700),
                        Image.asset(
                          'assets/png/norwich_city.png',
                          width: 63.r,
                          height: 63.r,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
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
                  Container(
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
                                style: AppTextStyles.cn12_400.copyWith(
                                  color: AppTheme.grey,
                                ),
                              ),
                              Text("3.56", style: AppTextStyles.cn12_700),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
