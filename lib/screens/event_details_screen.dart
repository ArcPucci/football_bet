import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/models/models.dart';
import 'package:football_bet/providers/providers.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Consumer<EventsProvider>(
            builder: (context, value, Widget? child) {
              final event = value.eventModel;
              final team1 = value.eventModel!.firstTeam;
              final team2 = value.eventModel!.secondTeam;
              final player = value.player;

              return SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 85.h),
                  child: Column(
                    children: [
                      Text(
                        "${getTitle(value.eventModel!.sportType)}\nMATCH",
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
                                child: Text(
                                  'MAN CITY',
                                  style: AppTextStyles.cns10,
                                ),
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
                      BetsBox(
                        win: value.eventModel!.odd1,
                        loss: value.eventModel!.odd2,
                        draw: value.eventModel!.odd3,
                      ),
                      SizedBox(height: 30.h),
                      SizedBox(
                        width: 350.w,
                        child: Text("match bet", style: AppTextStyles.cns16),
                      ),
                      SizedBox(height: 30.h),
                      Container(
                        width: 320.w,
                        decoration: BoxDecoration(
                          color: AppTheme.black3,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 15.h,
                          horizontal: 15.w,
                        ),
                        child: Text(
                          value.eventModel!.description,
                          style: AppTextStyles.cn10_700,
                        ),
                      ),
                      SizedBox(height: 34.h),
                      if (!event!.isOver) ...[
                        Text(
                          "WILL END IN: ${event.days}D:${event.hours}H:${event.minutes}M",
                          style: AppTextStyles.cns15,
                        ),
                        SizedBox(height: 5.h),
                        Opacity(
                          opacity: 0.5,
                          child: Text(
                            "Make all your bets in time",
                            style: AppTextStyles.cn10_700,
                          ),
                        ),
                        SizedBox(height: 15.h),
                      ],
                      PlayerBetCard(
                        team1: team1,
                        team2: team2,
                        player: player,
                        active: !value.eventModel!.isOver,
                        onChangedBet: value.changeBet,
                        makeBet: value.updateEvent,
                      ),
                      Column(
                        children: List.generate(value.players.length, (index) {
                          final player = value.players[index];
                          return Padding(
                            padding: EdgeInsets.only(top: 15.h),
                            child: PlayerBetCard(
                              team1: team1,
                              team2: team2,
                              player: player,
                              active: !value.eventModel!.isOver,
                              makeBet: () => value.updatePlayer(index),
                              onChangedBet: (bet) =>
                                  value.updatePlayerBet(index, bet),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 30.h),
                      AddResultExpandableBox(
                        active: !value.eventModel!.isOver,
                        team1: team1,
                        team2: team2,
                        onAddResult: value.completeEvent,
                      ),
                      SizedBox(height: 250.h),
                    ],
                  ),
                ),
              );
            },
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
