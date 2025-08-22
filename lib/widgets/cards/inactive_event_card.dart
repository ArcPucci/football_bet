import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';

class InactiveEventCard extends StatelessWidget {
  const InactiveEventCard({super.key, required this.event, this.onTap});

  final Event event;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final list = [event.firstTeam, event.secondTeam];
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 320.w,
        height: 263.h,
        decoration: BoxDecoration(
          color: AppTheme.red,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 86.w,
              height: 33.h,
              decoration: BoxDecoration(
                color: event.win! ? AppTheme.green : AppTheme.red2,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
              ),
              alignment: Alignment.topCenter,
              child: Text(
                event.win! ? "WIN" : "LOSS",
                style: AppTextStyles.cns24,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  getIcon(event.sportType),
                  width: 20.r,
                  height: 20.r,
                  color: Colors.white,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 5.w),
                Text(getTitle(event.sportType), style: AppTextStyles.cns14),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 60.w,
                  height: 115.h,
                  decoration: BoxDecoration(
                    color: AppTheme.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(list.length, (index) {
                      return Image.asset(
                        list[index].logo,
                        width: 40.r,
                        height: 40.r,
                        fit: BoxFit.fill,
                      );
                    }),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    height: 95.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(list.length, (index) {
                        final team = list[index];
                        final active =
                            (event.firstTeamScore > event.secondTeamScore &&
                                index == 0) ||
                            (event.firstTeamScore < event.secondTeamScore &&
                                index == 1) ||
                            (event.firstTeamScore == event.secondTeamScore);
                        final score = index == 0
                            ? event.firstTeamScore
                            : event.secondTeamScore;
                        return SizedBox(
                          height: 40.r,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    team.shortName,
                                    style: AppTextStyles.cn12_700,
                                  ),
                                  Text(
                                    team.name,
                                    style: AppTextStyles.cn12_400.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Opacity(
                                opacity: active ? 1 : 0.4,
                                child: Container(
                                  width: 40.r,
                                  height: 40.r,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppTheme.black,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "$score",
                                    style: AppTextStyles.cns24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 300.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: AppTheme.black,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Image.asset(
                    event.firstTeam.logo,
                    width: 40.r,
                    height: 40.r,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Odds",
                        style: AppTextStyles.cns10.copyWith(
                          color: AppTheme.grey3,
                        ),
                      ),
                      Text(
                        "3.22",
                        style: AppTextStyles.cn12_400.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Stake",
                        style: AppTextStyles.cns10.copyWith(
                          color: AppTheme.grey3,
                        ),
                      ),
                      Text(
                        "WIN",
                        style: AppTextStyles.cn12_400.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    event.win! ? "WIN" : "LOSS",
                    style: AppTextStyles.cns20.copyWith(
                      color: event.win! ? AppTheme.green : AppTheme.red3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getTitle(SportType sportType) => switch (sportType) {
    SportType.soccer => 'SOCCER',
    SportType.basketball => 'BASKETBALL',
    SportType.football => 'FOOTBALL',
  };

  String getIcon(SportType sportType) => switch (sportType) {
    SportType.soccer => 'assets/png/soccer_ball_2.png',
    SportType.basketball => 'assets/png/basketball_ball.png',
    SportType.football => 'assets/png/football_ball.png',
  };

  double? getOdds(int value) {
    if (value == 0) {
      return event.odd1;
    } else if (value == 1) {
      return event.odd2;
    }
    return event.odd3;
  }

  String getStake(int value) {
    if (value == 0) {
      return "WIN";
    } else if (value == 1) {
      return "LOSE";
    }
    return "DRAW";
  }
}
