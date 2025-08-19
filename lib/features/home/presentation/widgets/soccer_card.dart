import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/features/home/home.dart';

class SoccerCard extends StatelessWidget {
  const SoccerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GameTypeCard(
      text: "SOCCER",
      asset: "assets/png/soccer_player.png",
      width: 139.r,
      height: 197.r,
      right: 15.r,
      bottom: 15.r,
    );
  }
}
