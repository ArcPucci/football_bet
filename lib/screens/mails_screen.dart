import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';

class MailsScreen extends StatelessWidget {
  const MailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                SizedBox(height: 85.h),
                MessagesDivider(text: "new message"),
                SizedBox(height: 20.h),
                Column(
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: EdgeInsets.only(top: index != 0 ? 20.h : 0),
                      child: Container(
                        width: 355.w,
                        height: 67.h,
                        decoration: BoxDecoration(
                          color: AppTheme.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/png/soccer_ball_2.png',
                              width: 39.r,
                              height: 39.r,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "MAn Citu — Norwich City",
                                  style: AppTextStyles.cn15_400,
                                ),
                                Opacity(
                                  opacity: 0.5,
                                  child: Text(
                                    "The bet closes in 55 minutes",
                                    style: AppTextStyles.cn10_400.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: CustomAppBar(
            text: "Notification",
            child: SizedBox(
              width: 218.w,
              child: Center(
                child: CustomButton2(
                  text: "Clean all",
                  width: 178.w,
                  height: 47.h,
                  textStyle: AppTextStyles.cn16_400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
