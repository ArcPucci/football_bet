import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/models/models.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class TeamScoreCard extends StatelessWidget {
  const TeamScoreCard({super.key, required this.teamModel});

  final TeamModel teamModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 109.w,
      height: 131.h,
      decoration: BoxDecoration(
        color: AppTheme.black,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLogo(teamModel),
          Text(teamModel.shortName, style: AppTextStyles.cns14),
          NumberPicker(
            initialValue: 3,
            enabled: false,
            primaryColor: AppTheme.green,
          ),
        ],
      ),
    );
  }

  Widget _buildLogo(TeamModel team) {
    if (team.customTeam) {
      return ClipOval(
        child: Image.file(
          File(teamModel.logo),
          width: 40.r,
          height: 40.r,
          fit: BoxFit.cover,
        ),
      );
    }

    return Image.asset(
      teamModel.logo,
      width: 40.r,
      height: 40.r,
      fit: BoxFit.cover,
    );
  }
}
