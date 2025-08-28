import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/models/models.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class GameCard extends StatelessWidget {
  const GameCard({super.key, this.onTap, required this.eventModel});

  final EventModel eventModel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final firstTeam = eventModel.event.firstTeam;
    final secondTeam = eventModel.event.secondTeam;

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
            if (!eventModel.event.isOver)
              Positioned(
                bottom: 20.h,
                child: Text(
                  "WILL END IN: ${eventModel.event.days}D:${eventModel.event.hours}H:${eventModel.event.minutes}M",
                  style: AppTextStyles.cn15_700,
                ),
              ),
            if (eventModel.event.isOver)
              Positioned(
                bottom: 5.h,
                child: CustomButton2(
                  text: "ADD RESULT",
                  width: 304.w,
                  height: 45.h,
                  color: Colors.white,
                  textStyle: AppTextStyles.cns15.copyWith(color: AppTheme.red),
                  onTap: onTap,
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
                          getIcon(eventModel.event.sportType),
                          width: 20.r,
                          height: 20.r,
                          color: Colors.white,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          getTitle(eventModel.event.sportType),
                          style: AppTextStyles.cn14_700,
                        ),
                      ],
                    ),
                    SizedBox(height: 7.h),
                    CommandsLogo(
                      firstLogo: firstTeam.logo,
                      secondLogo: secondTeam.logo,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150.r,
                          child: Center(
                            child: Text(
                              firstTeam.name,
                              style: AppTextStyles.cn12_700,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150.r,
                          child: Center(
                            child: Text(
                              secondTeam.name,
                              style: AppTextStyles.cn12_700,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    BetsBox(
                      win: eventModel.event.odd1,
                      loss: eventModel.event.odd2,
                      draw: eventModel.event.odd3,
                    ),
                  ],
                ),
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
}
