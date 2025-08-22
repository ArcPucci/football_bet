import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/models/models.dart';
import 'package:football_bet/widgets/avatar_circle.dart';

import '../../utils/utils.dart';

class PlayerBetReview extends StatelessWidget {
  const PlayerBetReview({
    super.key,
    required this.index,
    required this.player,
    this.owner = false,
    required this.result,
  });

  final int index;
  final Player player;
  final bool owner;
  final int result;

  @override
  Widget build(BuildContext context) {
    final win = result == player.firstParticipantWins;
    return SizedBox(
      width: 266.w,
      height: 28.r,
      child: Row(
        children: [
          Text("${index + 1}", style: AppTextStyles.cn24_700),
          Spacer(),
          SizedBox(
            width: 117.w,
            child: Row(
              children: [
                AvatarCircle(
                  size: 28.r,
                  photo: player.photo,
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (owner) Text("owner", style: AppTextStyles.cn10_400),
                      Text(
                        player.name,
                        style: AppTextStyles.cns10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 30.w),
          Container(
            width: 67.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: win ? AppTheme.green : AppTheme.red,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Text(win ? "WIN" : 'LOSS', style: AppTextStyles.cns10),
          ),
        ],
      ),
    );
  }
}
