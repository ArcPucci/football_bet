import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/features/home/home.dart';

class FootballCard extends StatelessWidget {
  const FootballCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GameTypeCard(
      text: "FOOTBALL",
      asset: 'assets/png/football_player.png',
      width: 167.r,
      height: 204.r,
      right: 0.r,
      bottom: 15.r,
    );
  }
}
