import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/widgets/widgets.dart';

import '../models/models.dart';
import '../utils/utils.dart';

class CommandScore extends StatelessWidget {
  const CommandScore({
    super.key,
    required this.primaryColor,
    required this.team,
    this.onChangeScore,
  });

  final TeamModel team;
  final Color primaryColor;
  final void Function(int)? onChangeScore;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 286.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: AppTheme.black2,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.only(left: 10.w, right: 12.w),
      child: Row(
        children: [
          _buildLogo(),
          SizedBox(width: 10.w),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(team.name, style: AppTextStyles.cns12),
            ),
          ),
          SizedBox(width: 10.w),
          NumberPicker(primaryColor: primaryColor, onChanged: onChangeScore),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    if (team.customTeam) {
      return ClipOval(
        child: Image.file(
          File(team.logo),
          width: 38.r,
          height: 38.r,
          fit: BoxFit.cover,
        ),
      );
    }

    return Image.asset(team.logo, width: 38.r, height: 38.r, fit: BoxFit.cover);
  }
}
