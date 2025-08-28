import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/utils/utils.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SafeArea(
            bottom: false,
            child: Consumer<LeaderboardProvider>(
              builder: (context, value, Widget? child) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 85.h),
                  child: Column(
                    children: [
                      SportTypesBox(
                        sportModel: value.sportModel,
                        onChanged: value.changeSport,
                      ),
                      SizedBox(height: 30.h),
                      Column(
                        children: List.generate(value.events.length, (index) {
                          final event = value.events[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 15.h),
                            child: GestureDetector(
                              onTap: () => value.selectEvent(event),
                              child: Container(
                                width: 355.w,
                                height: 67.h,
                                decoration: BoxDecoration(
                                  color: AppTheme.red,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      value.sportModel.logo,
                                      width: 32.r,
                                      height: 32.r,
                                      color: Colors.white,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(width: 10.w),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              "${event.firstTeam.name} - ${event.secondTeam.name}",
                                              style: AppTextStyles.cn13_400,
                                            ),
                                          ),
                                          Opacity(
                                            opacity: 0.5,
                                            child: Text(
                                              event.startTime.shortDate,
                                              style: AppTextStyles.cn10_400
                                                  .copyWith(color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/png/next.png',
                                      width: 39.r,
                                      height: 39.r,
                                      fit: BoxFit.fill,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 200.h),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: CustomAppBar(text: 'Leaderboard', child: ProfileButtons()),
        ),
      ],
    );
  }
}
