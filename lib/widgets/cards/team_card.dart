import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/models/models.dart';

import '../../utils/utils.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({
    super.key,
    this.selected = false,
    required this.team,
    this.onTap,
  });

  final bool selected;
  final TeamModel team;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: selected ? 1 : 0.5,
        child: Container(
          width: 355.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: selected ? AppTheme.red : AppTheme.black,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            children: [
              ClipOval(child: _buildLogo()),
              SizedBox(width: 5.w),
              Expanded(child: Text(team.name, style: AppTextStyles.cns14)),
              SizedBox(width: 5.w),
              SizedBox(
                width: 90.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(5, (index) {
                    final enabled = team.rating > index;
                    return Opacity(
                      opacity: enabled ? 1 : 0.4,
                      child: Image.asset(
                        'assets/png/red_star.png',
                        width: 13.r,
                        height: 13.r,
                        color: selected ? Colors.white : null,
                        fit: BoxFit.fill,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    if (team.logoFromAsset) {
      return Image.asset(
        team.logo,
        width: 50.r,
        height: 50.r,
        fit: BoxFit.cover,
      );
    }

    return Image.file(
      File(team.logo),
      width: 50.r,
      height: 50.r,
      fit: BoxFit.cover,
    );
  }
}
