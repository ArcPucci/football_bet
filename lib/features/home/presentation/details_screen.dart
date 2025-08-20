import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/core/core.dart';
import 'package:football_bet/shared/widgets/widgets.dart';

import '../home.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 85.h),
                  Text(
                    "SOCCER\nMATCH",
                    style: AppTextStyles.cns32,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 29.h),
                  CommandsLogo(
                    firstLogo: 'assets/png/man_city.png',
                    secondLogo: 'assets/png/norwich_city.png',
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 235.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 63.r,
                          child: FittedBox(
                            fit: BoxFit.none,
                            child: Text('MAN CITY', style: AppTextStyles.cns10),
                          ),
                        ),
                        SizedBox(
                          width: 63.r,
                          child: FittedBox(
                            fit: BoxFit.none,
                            child: Text(
                              'NORWICH CITY',
                              style: AppTextStyles.cns10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  BetsBox(),
                  SizedBox(height: 30.h),
                  SizedBox(
                    width: 350.w,
                    child: Text("match bet", style: AppTextStyles.cns16),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: 320.w,
                    padding: EdgeInsets.symmetric(
                      vertical: 15.h,
                      horizontal: 15.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.black3,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "Біле, світле, нефільтроване, 12 банок з програвшого",
                      style: AppTextStyles.cn10_700,
                    ),
                  ),
                  SizedBox(height: 34.h),
                  Text("WILL END IN: 1D:12H:30M", style: AppTextStyles.cns15),
                  SizedBox(height: 5.h),
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      "Make all your bets in time",
                      style: AppTextStyles.cn10_700,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Column(
                    children: List.generate(4, (index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 25.h),
                        child: Container(
                          width: 323.w,
                          height: 67.h,
                          decoration: BoxDecoration(
                            color: AppTheme.black4,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 45.r,
                                height: 45.r,
                                child: Placeholder(),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("owner", style: AppTextStyles.cn10_400),
                                  Text(
                                    "Max Popovich",
                                    style: AppTextStyles.cn15_400,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                width: 39.r,
                                height: 39.r,
                                decoration: BoxDecoration(
                                  color: AppTheme.red,
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: RotatedBox(
                                  quarterTurns: -1,
                                  child: Image.asset(
                                    'assets/png/back.png',
                                    width: 24.r,
                                    height: 24.r,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(
                    width: 325.w,
                    child: ExpandableBox(
                      triggerBuilder: (context, toggle, toggled) {
                        return CustomButton1(
                          text: "ENTER THE RESULTS",
                          onTap: toggle,
                          toggled: toggled,
                        );
                      },
                      child: Container(
                        width: 325.w,
                        height: 233.h,
                        decoration: BoxDecoration(
                          color: AppTheme.black,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(20),
                          ),
                        ),
                        padding: EdgeInsets.only(top: 20.h, bottom: 18.h),
                        child: Column(
                          children: [
                            CommandScore(),
                            SizedBox(height: 10.h),
                            CommandScore(),
                            Spacer(),
                            CustomButton2(text: "CHECK WINNER"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 500.h),
                ],
              ),
            ),
          ),
        ),
        Positioned(top: 0, child: CustomAppBar(text: 'back', hasBack: true)),
      ],
    );
  }
}
