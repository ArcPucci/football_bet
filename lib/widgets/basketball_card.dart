import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../providers/providers.dart';

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
      onTap: () {
        final routerProvider = Provider.of<RouterProvider>(
          context,
          listen: false,
        );

        routerProvider.goToCreateEvent(SportType.basketball);
      },
    );
  }
}
