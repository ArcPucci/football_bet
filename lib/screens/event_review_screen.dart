import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/providers/providers.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class EventReviewScreen extends StatelessWidget {
  const EventReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SafeArea(
            bottom: false,
            child: Consumer<LeaderboardProvider>(
              builder: (context, value, Widget? child) {
                final team1 = value.event.firstTeam;
                final team2 = value.event.secondTeam;
                final result =
                    value.event.firstTeamScore > value.event.secondTeamScore
                    ? 0
                    : value.event.firstTeamScore < value.event.secondTeamScore
                    ? 1
                    : 2;
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 85.h),
                  child: Column(
                    children: [
                      Text(
                        "${getTitle(value.event.sportType)}\nMATCH",
                        style: AppTextStyles.cns32,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 29.h),
                      CommandsLogo(
                        firstLogo: team1.logo,
                        secondLogo: team2.logo,
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
                                child: Text(
                                  team1.name,
                                  style: AppTextStyles.cns10,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 63.r,
                              child: FittedBox(
                                fit: BoxFit.none,
                                child: Text(
                                  team2.name,
                                  style: AppTextStyles.cns10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      BetsBox(
                        win: value.event.odd1,
                        loss: value.event.odd2,
                        draw: value.event.odd3,
                      ),
                      SizedBox(height: 20.h),
                      Stack(
                        children: [
                          Consumer<ProfileProvider>(
                            builder:
                                (BuildContext context, value2, Widget? child) {
                                  return PlayerBetReview(
                                    index: 0,
                                    player: Player(
                                      id: 0,
                                      eventId: value.event.id,
                                      name: '${value2.name} ${value2.surname}',
                                      photo: value2.profilePhoto ?? '',
                                    ),
                                    result: result,
                                  );
                                },
                          ),
                          Column(
                            children: List.generate(value.players.length, (
                              index,
                            ) {
                              final player = value.players[index];
                              return Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: PlayerBetReview(
                                  index: index + 1,
                                  player: player,
                                  result: result,
                                ),
                              );
                            }),
                          ),
                          Positioned(
                            top: 0,
                            left: 31.w,
                            bottom: 0,
                            child: Container(
                              width: 1.sp,
                              color: Colors.white.withValues(alpha: 0.5),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 87.w,
                            bottom: 0,
                            child: Container(
                              width: 1.sp,
                              color: Colors.white.withValues(alpha: 0.5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: CustomAppBar(
            text: "back",
            hasBack: true,
            child: ProfileButtons(),
          ),
        ),
      ],
    );
  }

  String getTitle(SportType sportType) => switch (sportType) {
    SportType.soccer => "SOCCER",
    SportType.basketball => "BASKETBALL",
    SportType.football => "FOOTBALL",
  };
}
