import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';

class TeamLogoCard extends StatelessWidget {
  const TeamLogoCard({super.key, this.onTap, this.team});

  final TeamModel? team;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: _buildLogo(),
    );
  }

  Widget _buildLogo() {
    if (team != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          team!.logo,
          width: 63.r,
          height: 63.r,
          fit: BoxFit.cover,
        ),
      );
    }

    return Container(
      width: 63.r,
      height: 63.r,
      decoration: BoxDecoration(
        color: AppTheme.black,
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      child: Image.asset(
        'assets/png/plus.png',
        width: 15.r,
        height: 15.r,
        fit: BoxFit.fill,
      ),
    );
  }
}
