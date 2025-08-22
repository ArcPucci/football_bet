import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/models/models.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class PlayerBetCard extends StatelessWidget {
  PlayerBetCard({
    super.key,
    required this.team1,
    required this.team2,
    required this.player,
    this.owner = false,
    this.active = true,
    required this.onChangedBet,
    this.makeBet,
  });

  final bool owner;
  final bool active;
  final TeamModel team1;
  final TeamModel team2;
  final Player player;
  final void Function(int index) onChangedBet;
  final VoidCallback? makeBet;

  final list = ['WIN', 'LOSS', 'DRAW'];

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: active ? 1 : 0.5,
      child: SizedBox(
        width: 323.w,
        child: ExpandableBox(
          child: Container(
            width: 323.w,
            padding: EdgeInsets.only(top: 10.h, bottom: 22.h),
            decoration: BoxDecoration(
              color: AppTheme.black3,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: 238.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(2, (index) {
                      final team = index == 0 ? team1 : team2;
                      return TeamScoreCard(teamModel: team);
                    }),
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  "${team1.shortName} — ${team2.shortName}",
                  style: AppTextStyles.cn14_700,
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 293.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150.w,
                        height: 47.h,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.sp, color: AppTheme.red),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: _buildBetBox(),
                      ),
                      CustomButton2(
                        text: "MAKE BET",
                        width: 134.w,
                        height: 47.h,
                        onTap: makeBet,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 293.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(list.length, (index) {
                      final selected = player.firstParticipantWins == index;
                      return GestureDetector(
                        onTap: () => onChangedBet.call(index),
                        child: Container(
                          width: 94.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: selected ? AppTheme.red : AppTheme.black2,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            list[index],
                            style: AppTextStyles.cn12_700,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          triggerBuilder: (context, toggle, toggled) => GestureDetector(
            onTap: active ? toggle : null,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: toggled ? AppTheme.black : null,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Container(
                width: 323.w,
                height: 67.h,
                decoration: BoxDecoration(
                  color: AppTheme.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    AvatarCircle(
                      size: 45.r,
                      photo: player.photo,
                      bgColor: AppTheme.black3,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (owner)
                            Opacity(
                              opacity: 0.5,
                              child: Text(
                                "owner",
                                style: AppTextStyles.cn10_400,
                              ),
                            ),
                          Text(player.name, style: AppTextStyles.cn15_400),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w),
                    CustomSwitchBox(toggled: toggled),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBetBox() {
    if (player.firstParticipantWins == 0) {
      return Row(
        children: [
          SizedBox(width: 10.w),
          Text("WIN", style: AppTextStyles.cns16),
          SizedBox(width: 5.r),
          Padding(
            padding: EdgeInsets.only(top: 4.r),
            child: Text("→", style: AppTextStyles.cns20),
          ),
          SizedBox(width: 5.r),
          Text(
            "+1 win",
            style: AppTextStyles.cns16.copyWith(color: AppTheme.green),
          ),
        ],
      );
    }
    if (player.firstParticipantWins == 1) {
      return Row(
        children: [
          SizedBox(width: 10.w),
          Text("LOSE", style: AppTextStyles.cns14),
          SizedBox(width: 5.r),
          Padding(
            padding: EdgeInsets.only(top: 4.r),
            child: Text("→", style: AppTextStyles.cns16),
          ),
          SizedBox(width: 5.r),
          Text(
            "+1 lose",
            style: AppTextStyles.cns14.copyWith(color: AppTheme.red),
          ),
        ],
      );
    }
    return Row(
      children: [
        SizedBox(width: 8.r),
        Text("DRAW", style: AppTextStyles.cns12),
        SizedBox(width: 5.r),
        Padding(
          padding: EdgeInsets.only(top: 4.r),
          child: Text("→", style: AppTextStyles.cns16),
        ),
        SizedBox(width: 5.r),
        Text("+1 draw", style: AppTextStyles.cns12),
      ],
    );
  }
}
