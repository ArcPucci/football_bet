import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home.dart';

class BasketballCard extends StatelessWidget {
  const BasketballCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GameTypeCard(
      text: "BASKETBALL",
      asset: 'assets/png/basketball_player.png',
      width: 217.r,
      height: 212.r,
      right: -30.r,
      bottom: 15.r,
    );
  }
}
