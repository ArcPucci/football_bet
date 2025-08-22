import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/models/models.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class AddResultExpandableBox extends StatefulWidget {
  const AddResultExpandableBox({
    super.key,
    required this.active,
    required this.team1,
    required this.team2,
    required this.onAddResult,
  });

  final bool active;
  final TeamModel team1;
  final TeamModel team2;
  final void Function(int score1, int score2) onAddResult;

  @override
  State<AddResultExpandableBox> createState() => _AddResultExpandableBoxState();
}

class _AddResultExpandableBoxState extends State<AddResultExpandableBox> {
  int _team1Score = 0;
  int _team2Score = 0;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.active ? 1 : 0.5,
      child: SizedBox(
        width: 325.w,
        child: ExpandableBox(
          triggerBuilder: (context, toggle, toggled) {
            return CustomButton1(
              text: "ENTER THE RESULTS",
              onTap: widget.active ? toggle : null,
              toggled: toggled,
            );
          },
          child: Container(
            width: 325.w,
            height: 233.h,
            decoration: BoxDecoration(
              color: AppTheme.black,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            padding: EdgeInsets.only(top: 20.h, bottom: 18.h),
            child: Column(
              children: [
                CommandScore(
                  primaryColor: AppTheme.green,
                  team: widget.team1,
                  onChangeScore: (score) => _team1Score = score,
                ),
                SizedBox(height: 10.h),
                CommandScore(
                  primaryColor: AppTheme.red,
                  team: widget.team2,
                  onChangeScore: (score) => _team2Score = score,
                ),
                Spacer(),
                CustomButton2(
                  text: "CHECK WINNER",
                  onTap: () => widget.onAddResult(_team1Score, _team2Score),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
