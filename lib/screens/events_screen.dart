import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/widgets.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 55.h),
                  SoccerCard(),
                  FootballCard(),
                  BasketballCard(),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: CustomAppBar(
            text: "create new",
            hasBack: false,
            child: ProfileButtons(),
          ),
        ),
      ],
    );
  }
}
